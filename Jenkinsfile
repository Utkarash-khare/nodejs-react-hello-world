pipeline {
    agent any

    environment {
        // Define environment variables as needed
        CONTAINER_NAME = 'my-node-container'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from your version control system (e.g., Git)
                checkout scm
            }
        }

        

        stage('Push Docker Image') {
            steps {
                script {
 
                    // Log in to Docker registry
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                       // Build the Docker image
                    sh "docker build -t ${DOCKER_USERNAME}/nodeapp:jenkikns ." 
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    // Push the Docker image to your registry (e.g., Docker Hub)
                    sh "docker push ${DOCKER_USERNAME}/nodeapp:jenkikns"
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                // Run the Docker container
                script {
                    docker.image('khareutkarsh/nodeapp:jenkikns').run('-p 8080:80')
                }
            }
        }
    }
}
