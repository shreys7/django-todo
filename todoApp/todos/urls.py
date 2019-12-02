from django.urls import path
from . import views

app_name='todos'
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('<int:todo_id>/edit', views.edit, name='edit'),
    path('<int:todo_id>/save', views.save, name='save')
]