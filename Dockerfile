FROM python:3
RUN pip install django==3.2
Copy . .
Run python manage.py migrate
CMD ["python","manage.py","runserver","0.0.0.0:8001"]
