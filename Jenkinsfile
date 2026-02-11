pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Crystalite0201/devops-project-complete.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvnw clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t springboot-app:latest .'
            }
        }
    }
}
