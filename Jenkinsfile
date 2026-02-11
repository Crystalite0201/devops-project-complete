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
                docker push %IMAGE%
                '''
            }
        }

        stage('Deploy on EC2') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    bat '''
                    ssh -o StrictHostKeyChecking=no %EC2_USER%@%EC2_IP% ^
                    "docker pull %IMAGE% && \
                     docker stop app || true && \
                     docker rm app || true && \
                     docker run -d -p 8089:8080 --name app %IMAGE%"
                    '''
                }
            }
        }
    }
}
