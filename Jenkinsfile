pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/Kevinkingsley/Myapp.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: 'github-token', url: "${GIT_REPO_URL}"
            }
        }

        stage('Build Application') {
            steps {
                // Command to build your application, e.g. for a React app:
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Deploy Application') {
            steps {
                // Command to deploy your application
                // Example: Deploy to a server or container
            }
        }
    }
}


