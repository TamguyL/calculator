pipeline {
    agent any

    tools {
        // Assure-toi que Maven est installé et configuré dans Jenkins
        maven 'Maven 3.6.3'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the code from the repository
                git 'https://github.com/TamguyL/calculator.git'
            }
        }

        stage('Build') {
            steps {
                // Build the Spring Boot application
                sh './mvnw clean install'
            }
        }

        stage('Test') {
            steps {
                // Run the tests
                sh './mvnw test'
            }
        }

        stage('Package') {
            steps {
                // Package the application
                sh './mvnw package'
            }
        }

    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}