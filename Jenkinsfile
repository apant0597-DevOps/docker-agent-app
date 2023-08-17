
currentBuild.displayName = "Docker-Agent-App#"+currentBuild.number
pipeline {
    agent {
        docker { 
		image 'maven' 
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
