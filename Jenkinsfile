pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SalmaAhmed20/Node-js-App'
                sh 'ls'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/nodejs-app .'
                sh 'docker images'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Image')
        {
            steps{
                sh 'docker push $DOCKERHUB_CREDENTIALS_USR/nodejs-app'
            }
        }
        stage ('Deploy'){
            steps{
                sh 'cd k8sfiles'
                sh 'kubectl apply -f deploy.yaml'
                sh 'kubectl apply -f svc.yaml'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}