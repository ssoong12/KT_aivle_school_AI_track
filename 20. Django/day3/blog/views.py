from django.shortcuts import render
from . import models

# posts = {
#     "01": {'title': 'Template', 'content': 'Template is ...'},
#     "02": {'title': 'ORM', 'content': 'ORM is ...'},
# }

def home(req):
    posts = models.Post.objects.all()
    return render(req, 'blog/index.html', {
        'post_list': posts, 
        'post': {
            'title': 'Django',
            'content': 'Django is ...'
        }
    })

def post_list(req, id):
    posts = models.Post.objects.all()
    post = models.Post.objects.get(id=id)
    return render(req, 'blog/index.html', {
        'post_list': posts, 
        'post' : post
    })

# id:01
# { 'post_list': posts, 'title': 'Django', 'content': 'Django is ...'}
# id:02
# { 'post_list': posts, 'title': 'ORM', 'content': 'ORM is ...'}
