from django.contrib import admin

# 모델 추가
from . import models

admin.site.register(models.Post)