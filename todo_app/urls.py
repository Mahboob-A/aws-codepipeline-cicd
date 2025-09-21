from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('todo/', views.todo_list, name='todo_list'),
    path('todo/<int:todo_id>/', views.todo_detail, name='todo_detail'),
]
