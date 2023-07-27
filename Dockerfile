FROM python:3
pip3 install -r requirements.txt

COPY . . 

RUN python manage.py migrate

CMD ["python","manage.py","runserver","0.0.0.0:8000"]
