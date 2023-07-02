From python:3
RUN pip install django==3.2
COPY . .
RUN python manage.py makemigrations
RUN python manage.py migrate
python manage.py createsuperuser
CMD ["python","manage.py","runserver","0.0.0.0:8001"]
