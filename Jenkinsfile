pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockercred')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url:'https://github.com/TamguyL/calculator.git', credentialsId: 'TamgyLB'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x ./mvnw'
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
                    docker.build("tamgylb/calcul:${env.BUILD_ID}")
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