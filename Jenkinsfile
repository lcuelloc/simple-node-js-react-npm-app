pipeline {
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker ps -f name=node-server -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -fname=node-server -q | xargs -r docker container rm'
                sh 'docker run -p 3000:3000 --name node-server node:6-alpine'
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
