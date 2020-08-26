pipeline {
    agent any
    tools {
        nodejs "nodejs10110"
    }
    environment {
        CURATOR_TOKEN = credentials('dlr_test_curator_token')
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