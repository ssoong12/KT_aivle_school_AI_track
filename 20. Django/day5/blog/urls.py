from django.urls import path
from . import views 

urlpatterns = [
    path('', views.index),
    path('api/post/', views.api_posts),
    path('api/post/<int:id>', views.api_post),
]
