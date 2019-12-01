from django.db import models

class Todo(models.Model):
    name=models.CharField(max_length=100)
    created_date=models.DateField('Created')
    deadline=models.DateField('Deadline')
    description=models.CharField(max_length=200)

    def __str__(self):
        return self.name
