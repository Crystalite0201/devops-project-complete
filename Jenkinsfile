pipeline {
    agent any

    environment {
        EC2_USER = "ubuntu"
        EC2_IP   = "51.20.232.207"
        IMAGE    = "sanjuktasarkar172/devops_project:latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Crystalite0201/devops-project-complete.git'
            }
        }

        stage('Build App') {
            steps {
                bat 'mvnw clean package -DskipTests'
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                bat '''
                docker build -t %IMAGE% .
                '''
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                bat "docker push %IMAGE%"
            }
        }
    }
}
