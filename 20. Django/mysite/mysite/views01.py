from django.http import HttpResponse
def index(req):
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
      <li><a href="/chapter01">Setting & Deploy</a></li>
      <li><a href="/chapter02">Routing & View</a></li>
    </ol>
    <h2>Django</h2>
    <p><a href="https://www.djangoproject.com/" target="_blank">Django</a>는 Python으로 작성된 오픈 소스 웹 프레임워크로, 빠르고 쉬운 웹 개발을 가능하게 합니다.</p>
  </body>
</html>"""
    return HttpResponse(html)
  
def list(req):
  return HttpResponse("List")

def post(req, id):
  return HttpResponse(f"post {id}이다!")

def gugu(req, num):
  num = int(num)
  gugudan = [f"{num} * {i} = {num * i}" for i in range(1, 21)]
  return HttpResponse(f"<br>".join(gugudan))

def naver(req):
  import requests
  res = requests.get('https://www.naver.com')
  return HttpResponse(res.content)