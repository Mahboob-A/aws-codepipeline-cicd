from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.

def index(request):
    return JsonResponse({"message": "Welcome to the Todo API"})

def todo_list(request):
    todos = [
        {"id": 1, "task": "Learn Django"},
        {"id": 2, "task": "Build a Todo app"},
    ]
    return JsonResponse(todos, safe=False)

def todo_detail(request, todo_id):
    todo = {"id": todo_id, "task": f"Task {todo_id}"}
    return JsonResponse(todo)

