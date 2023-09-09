pipeline {
    agent any

    environment {
        // Define environment variables as needed
        IMAGE_NAME = 'my-node-app'
        CONTAINER_NAME = 'my-node-container'
        PUBLIC_IP = '54.81.131.214'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from your version control system (e.g., Git)
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker registry
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }

                    // Push the Docker image to your registry (e.g., Docker Hub)
                    sh "docker push $IMAGE_NAME"
                }
            }
        }

        stage('Run Container on Public IP') {
            steps {
                script {
                    // Run the Docker container on a public IP
                    sh "docker run -d -p 8000:80 --name $CONTAINER_NAME $IMAGE_NAME"
                }
            }
        }
    }
}
