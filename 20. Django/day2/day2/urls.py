"""
day2/urls import path, include
"""
from django.contrib import admin
# views.py를 import 해서 사용
from django.urls import path, include
from . import views
# blogView라는 이름으로 blog 폴더 밑에 있는 views.py 파일 호출
from blog import views as blogView

from django.http import FileResponse

# 동적으로 이미지 처리(static)
def load_img(req, name):
    img = open(f'./static/{name}.jpg', 'rb')
    return FileResponse(img, content_type='image/jpeg')

# template rendering
from django.shortcuts import render
def hello(req):
    return render(req, 'index.html')

# template 상속
def child(req):
    return render(req, 'child.html')

urlpatterns = [
    path('admin/', admin.site.urls),    
    path('', views.index),    
    path('chapter/<id>/', views.chapter),    
    path('control/', views.control),
    path('child/', child),
    path('hello/', hello),
    path('images/<name>/', load_img),    
    # blog의 urls.py로 가라 >> blog로 시작하는 건 모두 blog/urls에게 위임시킨다.
    path('blog/', include('blog.urls')),    
]
