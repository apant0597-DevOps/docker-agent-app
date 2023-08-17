
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
	stage('DEPLOY'){
            steps {
                sshagent(['jenkins-agent-creds']) {
                    sh '''
                    scp -o StrictHostKeyChecking=no target/docker-agent-app.war ec2-user@172.31.31.219:/opt/tomcat9/webapps
                    ssh ec2-user@172.31.31.219 /opt/tomcat9/bin/shutdown.sh
                    ssh ec2-user@172.31.31.219 /opt/tomcat9/bin/startup.sh
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
