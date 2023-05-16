from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.forms.models import model_to_dict
import json

from . import models

def index(req):
  posts = models.Post.objects.all()
  return HttpResponse(posts)

def api_posts(req):
    if req.method == 'GET':
      posts = models.Post.objects.all()
      return JsonResponse({'results': list(posts.values())})
    elif req.method == 'POST':
      # 포스트 생성
      body = json.loads(req.body.decode('utf-8'))
      # return JsonResponse(api_post_create(body))
      return JsonResponse('글쓰기', body)
    else:
      return HttpResponse(status=405)

def api_post(req, id):
  post = models.Post.objects.get(id=id)
  return JsonResponse({'results': model_to_dict(post)})