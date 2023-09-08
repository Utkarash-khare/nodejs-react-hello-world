pipeline {
    agent any

    stages {
        stage('Build and Deploy') {
            steps {
                script {
                    // Define a Docker image name (customize as needed)
                    def dockerImageName = 'your-react-app:latest'

                    // Build the Docker image
                    sh "docker build -t $dockerImageName ."

                    // Run the Docker container
                    sh "docker run -d -p 3000:3000 $dockerImageName"
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and images (optional)
            sh 'docker stop $(docker ps -q)'
            sh 'docker rmi $(docker images -q)'
        }
    }
}
