pipeline {
    agent any
    tools {
        nodejs "nodejs10110"
    }
    environment {
        CURATOR_TOKEN    = credentials('dlr_test_curator_token')
        RAIRAIRAI    = "RAIRAIRAI"
    }
    stages {
        stage('Install') {
            steps {
                sh "node -v"
                sh "npm -v"
                sh 'npm install'
                echo "Credentials : ${env.RAIRAIRAI}"
                echo "Credentials : ${env.CURATOR_TOKEN}"
            }
        }
        stage('Run tests') {
            steps {
                sh 'npx cypress run'
            }
        }
    }
}