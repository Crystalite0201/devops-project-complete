pipeline {
    agent any

    environment {
        EC2_USER = "ubuntu"
        EC2_IP   = "<EC2_PUBLIC_IP>"
        IMAGE    = "sanjuktasarkar172/devops_project:latest"
    }

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

        stage('Build & Deploy on EC2') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    bat """
                    ssh -o StrictHostKeyChecking=no %EC2_USER%@%EC2_IP% ^
                    "docker pull %IMAGE% && \
                     docker stop app || true && \
                     docker rm app || true && \
                     docker run -d -p 8089:8080 --name app %IMAGE%"
                    """
                }
            }
        }
    }
}
