FROM python:slim

WORKDIR /app
COPY . .
RUN pip install django 
CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
