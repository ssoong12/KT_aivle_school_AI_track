from django.db import models

# Create your models here.
# Post 모델 추가
class Post(models.Model):
  title = models.CharField(max_length=100)
  content = models.TextField()
  created_at = models.DateField(auto_now_add=True)
  published_at = models.DateField(null=True)