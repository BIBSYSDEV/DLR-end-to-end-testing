pipeline {
    agent any
    tools {
        nodejs "nodejs10110"
    }

    stages {
        stage('Install') {
            steps {
                sh "node -v"
                sh "npm -v"
                sh 'npm install'
            }
        }
        stage('Run tests') {
            steps {
                sh 'npx cypress run'
            }
        }
    }
}