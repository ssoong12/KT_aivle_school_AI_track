from django.shortcuts import render

posts = {
    "01": {'title': 'Template', 'content': 'Template is ...'},
    "02": {'title': 'ORM', 'content': 'ORM is ...'},
}

def home(req):
    return render(req, 'blog/index.html', {
        'post_list': posts, 
        'title': 'Django',
        'content': 'Django is ...'
    })

def post_list(req, id):
    return render(req, 'blog/index.html', {
        'post_list': posts, 
        **posts.get(id)
    })

# id:01
# { 'post_list': posts, 'title': 'Django', 'content': 'Django is ...'}
# id:02
# { 'post_list': posts, 'title': 'ORM', 'content': 'ORM is ...'}
