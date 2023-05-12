from django.contrib import admin

# Register your models here.
# 모델 추가
from . import models

admin.site.register(models.Student)
admin.site.register(models.Book)
admin.site.register(models.Course)