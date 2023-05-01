import pymongo, os, pickle
import numpy as np
from flask import *
from datetime import timedelta

app = Flask(__name__)
app.secret_key = os.urandom(24)
app.config['SECRET_KEY'] = os.urandom(24)
app.config['PERMANENT_SESSION_LIFETIME'] =  timedelta(minutes=1) # 세션 유지 시간 : 기본 31일
client = pymongo.MongoClient('mongodb://test:testpw@43.201.104.0:27017')

classification_dict = {100:"정치", 101:"경제", 102:"사회", 103:"생활/문화", 104:"세계", 105:"IT/과학"}

with open("static/models/model.pkl", "rb") as f:
    load_model = pickle.load(f)

# @app.before_request
# def make_session_permanent():
#     print('before_request 1 :', dict(request.values))
    # session.permanent = True
    # app.permanent_session_lifetime = timedelta(minutes=5)

@app.route("/") 
def index():
    user = {}
    if is_login():
        user["name"] = session["id"]
    return render_template('index.html', user=user)

@app.route("/join") 
def join():
    if is_login():
        return redirect('/')
    return render_template('join.html')

@app.route("/login") 
def login():
    if is_login():
        return redirect('/')
    return render_template('login.html')

@app.route("/contents") 
def contents():
    if is_login():
        return render_template('contents.html')
    else:
        return redirect('login')

@app.route("/api/join", methods=['POST']) 
def api_join():
    account = dict(request.values)
    print('account :', account)
    result = {}

    # connect collection
    collection = client.mongo.users

    # check account
    document = collection.find_one({'id': account['id']})
    print('document :', document)    
    if document: # already has account
        result['msg'] = 'hasAccount'
    else: # save account
        save_result = collection.insert_one(account)
        print(save_result.inserted_id)
        result['msg'] = 'joinAccount'
        result['save_result'] = str(save_result.inserted_id)

    print('result :', result)
    return jsonify(result), 200

@app.route("/api/login", methods=['POST']) 
def api_login():
    account = dict(request.values)
    print('account :', account)
    
    # check account on database
    collection = client.mongo.users
    document = collection.find_one({'id': account['id'], 'pw': account['pw']})

    result = {}
    if document: # There is account and pw
        session['id'] = account['id']
        result['msg'] = 'login'
    else: # There is no account or wrong pw
        result['msg'] = 'noAccount'

    return jsonify(result)

def is_login():
    try:
        session["id"]
        return True
    except:
        return False

@app.route("/api/login_session", methods=['POST']) 
def login_session():
    print('login_session')
    result = {}
    if is_login(): # status : login
        result['login_id'] = session['id']
        result['code'] = 200
    else: # status : logout
        result['code'] = 201
    return jsonify(result)

@app.route('/logout')
def logout():
    session.pop("id")
    return redirect('/')

@app.route('/api/category', methods=['POST'])
def category_model():
    data = dict(request.values)
    print(data['sentence'])
    result = {}

    global classification_dict
    proba = load_model.predict_proba([data['sentence']])[0]
    result['predict'] = list(zip(classification_dict.values(), np.round(proba, 3)))
    return jsonify(result)

# error route
@app.errorhandler(404)
def not_found(error):
    return render_template('error.html'), 404


# run was
app.run(debug=True)