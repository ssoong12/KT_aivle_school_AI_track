from django.contrib import admin
from . import models

class ChoiceInline(admin.TabularInline):
    model = models.Choice
    extra = 0

class QuestionAdmin(admin.ModelAdmin):
    list_filter = ['publish_date']
    list_display = ('question_text', 'publish_date', 'was_published_recently')
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information', {'fields': ['publish_date']}),
    ]
    inlines = [ChoiceInline]

admin.site.register(models.Question, QuestionAdmin)
admin.site.register(models.Choice)
