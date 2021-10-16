pipeline {
    agent {
        label 'kaniko'
    }
    
    environment {
		DOCKER_CRED=credentials('docker-hub-cervator-token')
	}

    stages {
        stage('Build') {
            steps {
              container('kaniko') {
                git 'https://github.com/Cervator/JenkinsAndroidSDKAgent.git'
                sh """
                    echo -n $DOCKER_CRED | base64 > token
                    tokenVar=\$(cat token)
                    sed -i "s/PLACEHOLDER/\$tokenVar/g" config.json
                    cp config.json /kaniko/.docker/config.json
                    /kaniko/executor -f ./Dockerfile -c \$(pwd) --reproducible --tarPath=JenkinsAndroidSDKAgent.tar --no-push
                """
                
                // --destination=terasology/jenkins-android-agent
                
                archiveArtifacts 'JenkinsAndroidSDKAgent.tar'
              }
            }
        }
    }
}
