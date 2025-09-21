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



from django.http import JsonResponse
# from django.db import connection

def health_check(request):
    try:
        # Check database connection
        # with connection.cursor() as cursor:
        #     cursor.execute("SELECT 1")
        
        return JsonResponse({
            'status': 'healthy',
            'database': 'connected'
        })
    except Exception as e:
        return JsonResponse({
            'status': 'unhealthy',
            'error': str(e)
        }, status=500)