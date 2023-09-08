pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    parameters {
        string(name: 'DOCKERHUB_CREDENTIALS', defaultValue: '', description: 'Docker Hub credentials ID')
    }

    stages {
        stage('Build and Publish') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker build -t ${DOCKER_USERNAME}/nodeapp:latest ."
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${DOCKER_USERNAME}/nodeapp:latest"
                }
            }
        }

        stage('Run Container') {
            steps {
                // Run the Docker container
                script {
                    def container = docker.image("${DOCKER_USERNAME}/nodeapp:latest").run('-p 8080:80')
                }
            }
        }
    }
}
