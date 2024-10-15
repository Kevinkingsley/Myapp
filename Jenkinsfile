pipeline {
    agent any

    environment {
        GIT_REPO_URL = ' https://github.com/Kevinkingsley/Myapp.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: 'github-token', url: "${GIT_REPO_URL}"
            }
        }

        // Other stages for build, push, and deploy can go here.
    }
}
