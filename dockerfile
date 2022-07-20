FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN python manage.py makemigrations 

RUN python manage.py migrate 

RUN python manage.py createsuperuser

EXPOSE 8000

CMD python manage.py runserver 0:8000

