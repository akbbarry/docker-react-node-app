pipeline {
    agent any

    stages {
        stage('Install dependencies') {
            steps {
                dir('my-app') {
                    sh 'npm install'
                }
            }
        }

        stage('Build app') {
            steps {
                dir('my-app') {
                    sh 'npm run build'
                }
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
                    credentialsId: 'docker-hub-repo',
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