pipeline {
    environment {
        CI = 'true'
    }
    stages {
        stage('Clean') {
            agent none
            steps {
                sh './jenkins/scripts/remove-docker.sh'
                sh './jenkins/scripts/run-docker.sh'
            }
        }
        agent {
            docker {
                image 'node:6-alpine'
                args '-p 3000:3000 --name node-server'
            }
        }
        stage('Build') {
            steps {
                sh './jenkins/scripts/install.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh 'docker exec -ti node-server ./jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'docker exec -ti node-server ./jenkins/scripts/kill.sh'
            }
        }
    }
}
