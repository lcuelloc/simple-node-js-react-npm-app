pipeline {

    environment {
        CI = 'true'
    }
    stages {
        stage('Remove Container') {
        	agent {
        		docker{
        			args 'docker ps -f name=node-server -q | xargs --no-run-if-empty docker container stop'
        		}
        	}
        }
        stage('Build') {
        	agent {
		    	docker {
		    		image 'node:6-alpine'
		    		args '-p 3000:3000 --name node-server'
		    	}
		    }
            steps {
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
