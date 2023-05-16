# 시리얼라이즈의 사용법이 모델폼과 사용법이 비슷함
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import serializers
from blog.models import Post

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']
        
class PostSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = Post
    fields = ['title', 'content']