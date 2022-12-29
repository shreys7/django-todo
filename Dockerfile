FROM apt-add-repository
FROM python3
RUN pip install django==3.2
COPY . .
RUN python manage.py migrate
CMD ["add-repository","python","manage.py","runserver","0.0.0.0:8000"]