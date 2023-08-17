
currentBuild.displayName = "Docker-Agent-App#"+currentBuild.number
pipeline {
    agent {
        docker { 
		image 'maven:3-alpine' 
		args '-u root'
	}
    }
    stages {
        stage('BUILD APP'){
            steps{
                sh 'mvn clean package'
            }
        }
	stage('ARCHIVE'){
	    steps {
		archiveArtifacts artifacts: 'target/*.war'	
		}
	}
	stage('DOCKER BUILD'){
            steps {
                sh '''		
		docker build . -t apant0597/maven-webapp:docker-agent			
		'''
            }  
        }
	stage('DOCKER PUSH'){
            steps {
                withCredentials([string(credentialsId: 'docker-cred', variable: 'dockerhubcred')]) {
                sh '''
		docker login -u apant0597 -p ${dockerhubcred}
		docker push apant0597/maven-webapp:docker-agent
		'''
            }
	    }
    }
    }
    post {
         success {
            sh 'echo BUILD PASS!'
         }
        unsuccessful {
            sh 'echo FAILURE!!!'
        }
    }
}
