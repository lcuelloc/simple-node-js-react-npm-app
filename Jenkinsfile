pipeline {
    agent none
    environment {
        CI = 'true'
    }
    stages {
        stage('Clean') {
            steps {
                sh './jenkins/scripts/remove-docker.sh'
                sh './jenkins/scripts/run-docker.sh'
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
