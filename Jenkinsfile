pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockercred')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/TamguyL/calculator.git'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }

        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("your-dockerhub-username/your-repo:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockercred') {
                        docker.image("tamgylb/calcul:${env.BUILD_ID}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
    }
}