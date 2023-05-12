from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE) # 일대일 관계
    name = models.CharField(max_length=50) # 문자열
    year = models.IntegerField() # 정수값
    
    # string 값으로 어떤 값을 출력해 줄지 결정
    def __str__(self):
      return f"{self.name}, {self.year}"

class Book(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField() # 긴 텍스트 
    
    def __str__(self):
      return f"{self.title}"

class Course(models.Model):
    title = models.CharField(max_length=100)
    students = models.ManyToManyField(Student) # 매니투매니 덕에 스투던트와 코스 사이에 릴레이션, 관계가 생김
    books = models.ForeignKey(Book, on_delete=models.CASCADE) # FK 로 연결
    
    def __str__(self):
      return f"{self.title}"
