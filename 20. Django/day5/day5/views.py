from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from . import serializers
from blog.models import Post

class UserViewSet(viewsets.ModelViewSet):
  queryset = User.objects.all().order_by('-date_joined')
  serializer_class = serializers.UserSerializer
  
class GroupViewSet(viewsets.ModelViewSet):
  queryset = Group.objects.all()
  serializer_class = serializers.GroupSerializer
  
class PostViewSet(viewsets.ModelViewSet):
  queryset = Post.objects.all()
  serializer_class = serializers.PostSerializer