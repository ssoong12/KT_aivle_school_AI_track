# blog/urls.py
from django.urls import path, include
from . import views

urlpatterns = [
    path('list/', views.post_list),
    path('detail/', views.post_detail),
]
