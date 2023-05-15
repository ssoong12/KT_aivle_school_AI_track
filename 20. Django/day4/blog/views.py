from django.shortcuts import render
from . import models

def detail(req, id):
    post = models.Post.objects.get(id=id)
    return render(req, "blog/detail.html", {
        "post": post
    })
    
def index(req):
    posts = models.Post.objects.all()
    return render(req, "blog/index.html", {
        "post_list": posts
    })
    