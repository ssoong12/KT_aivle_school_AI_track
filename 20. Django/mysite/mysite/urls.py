# views.py를 import해서 사용
from django.urls import path
from . import views

# index를 제외하고 맨 끝에 꼭 /를 붙여줘야 한다. 안 붙이는 게 표준이지만 장고는 이렇다..
urlpatterns = [
    path('', views.index),
    path('chapter/<id>/', views.chapter),
    path('search/', views.search)
]
