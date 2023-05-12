from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list),
    path('<id>/', views.post_detail),
]
