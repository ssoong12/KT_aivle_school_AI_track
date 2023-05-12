from django.shortcuts import render
from . import models

# posts = {
#     "01": {'title': 'Template', 'content': 'Template is ...'},
#     "02": {'title': 'ORM', 'content': 'ORM is ...'},
# }

def post_list(req):
   posts = models.Post.objects.all()
   return render(req, 'blog/index.html', { 'post_list': posts })

def post_detail(req, id: int):
   post = models.Post.objects.get(id=id)
   return render(req, 'blog/detail.html', { 'post': post })

# id:01
# { 'post_list': posts, 'title': 'Django', 'content': 'Django is ...'}
# id:02
# { 'post_list': posts, 'title': 'ORM', 'content': 'ORM is ...'}
