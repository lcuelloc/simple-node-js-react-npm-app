pipeline {
    agent any

    environment {
        CI = 'true'
    }
    stages {
        stage('Remove Container') {
            steps {
                sh 'docker ps -f name=node-server -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -fname=node-server -q | xargs -r docker container rm'
            }
        }
        stage('Build') {
            steps {
            	sh 'docker run -p 3000:3000 --name node-server image node:6-alpine'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
