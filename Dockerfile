  # Use an official Python runtime as a parent image
   FROM python:3.8

   # Set the working directory to /app
   WORKDIR /app

   # Copy the contents of the current directory into the container at /app
   COPY . /app

   # Change working directory to /app/django-todo
   WORKDIR /app/django-todo

   # Install any needed packages specified in requirements.txt
   RUN pip install --no-cache-dir -r requirements.txt

 # Make port 8000 available to the world outside this container
   EXPOSE 8000

   # Define environment variable
   ENV NAME World

   # Run app.py when the container launches
   CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]