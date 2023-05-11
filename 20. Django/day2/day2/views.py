from django.http import HttpResponse
from django.shortcuts import render

def index(req):
  data = {
    "title" : "Setting & Deploy",
    "content" : "<a href='https://www.djangoproject.com/'>Django</a> is..."
  }
  return render(req, 'index.html', data)
  
def chapter(req, id):
  chapters = {
    "01" : {
      "title" : "Setting & Deploy",
      "content" : "Setting & Deploy is .... 어쩌구저쩌궁",
    },
    "02" : {
      "title" : "Routing & View",
      "content" : "Routing & View is .... 어쩌구저쩌궁",
    }
  }
  return render(req, 'index.html', chapters.get(id))

# control.html 렌더링
def control(req):
  data = {
    'variable' : True,
    'another_variable' : True,
    'item_list' : ['사과', '딸기', '레몬'],
    'item_dict' : {'고양이': 4, '강아지': 4, '닭':2}
  }
  return render(req, 'control.html', data)