from django.shortcuts import render, get_object_or_404, redirect
from django.views import generic
from .models import Todo
from django.http import HttpResponseRedirect

class IndexView(generic.ListView):
    template_name = 'todos/index.html'
    context_object_name = 'todo_list'

    def get_queryset(self):
        """Return all the latest todos."""
        return Todo.objects.order_by('-created_at')

def save(request, todo_id):

    # form data from the request
    title = request.POST.get('title')
    description = request.POST.get('description')

    todo = get_object_or_404(Todo, pk=todo_id)
    todo.title = title
    todo.description = description

    todo.save()

    return redirect('todos:index')

def edit(request, todo_id):
    todo = get_object_or_404(Todo, pk=todo_id)
    return render(request, 'todos/form.html', {
        'todo': todo
    })