from django.contrib import admin
from django.urls import path, include
from .views import ResumeView


app_name = 'resume'

urlpatterns = [
    path('', ResumeView.as_view(), name='resume'),
]