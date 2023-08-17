
currentBuild.displayName = "Docker-Agent-App#"+currentBuild.number
pipeline {
    agent {
        docker { image 'maven' }
    }
    stages {
        stage('BUILD APP'){
            steps{
                sh '''
                mvn clean package'
		        mv target/*.war target/maven.war'
		        archiveArtifacts artifacts: 'target/maven.war'
                '''
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