pipeline {
    agent any

    environment {
        IMAGE_TAG="{BUILD_NUMBER}"
    }

    stages {
        stage('Code') {
            steps {
                 git url "https://github.com/himanshurkt96/django-todo-python.git", branch:'develop'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t himanshurkt96/cicd-todo:$(BUILD_NUMBER) '
            }
        }

    }

}
