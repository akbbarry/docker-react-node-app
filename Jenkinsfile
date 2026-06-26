pipeline {
    agent any

    tools {
        nodejs 'nodejs'
    }

    stages {

        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build app') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Build docker image') {
            steps {
                sh 'docker build -t alkerix/react-nodes-example:$BUILD_NUMBER .'
            }
        }

        stage('Push image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push alkerix/react-nodes-example:$BUILD_NUMBER
                    '''
                }
            }
        }
    }
}