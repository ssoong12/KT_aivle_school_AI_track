from django.urls import path
from . import views

urlpatterns = [
    path('', views.home),
    path('<id>/', views.post_list),
]
