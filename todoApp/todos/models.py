from django.db import models

class Todo(models.Model):
    name=models.CharField(max_length=100)
    created_at=models.DateTimeField('Created', auto_now_add=True)
    update_at=models.DateTimeField('Updated', auto_now=True)
    description=models.CharField(max_length=200)

    def __str__(self):
        return self.name
