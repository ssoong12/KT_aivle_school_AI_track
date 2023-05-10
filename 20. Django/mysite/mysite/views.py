from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

html = """<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Django</title>
  </head>
  <body>
    <h1><a href="/">Django</a></h1>
    <ol>
      <li><a href="/chapter/01/">Setting & Deploy</a></li>
      <li><a href="/chapter/02/">Routing & View</a></li>
    </ol>
    <h2>{title}</h2>
    <p>{content}</p>
    <p><a href="https://www.djangoproject.com/" target="_blank">Django</a>는 Python으로 작성된 오픈 소스 웹 프레임워크로, 빠르고 쉬운 웹 개발을 가능하게 합니다.</p>
  </body>
</html>"""

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

def index(req):
  d = {
    'title' : 'django',
    'content' : 'django is 어쩌구저꺼웅... 인덱스임'
  }
  return HttpResponse(html.format(**d))

def chapter(req, id):
  return HttpResponse(html.format(**chapters.get(id)))

@csrf_exempt
def search(request):
  print(request.method)
  print(f"Query String: {request.GET.get('q')}")
  print(f"BODY: {request.POST.get('key', '')}")
  return HttpResponse(f'search')