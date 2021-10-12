pipeline {
    agent {
        label 'kaniko'
    }

    stages {
        stage('Build') {
            steps {
              container('kaniko') {
                sh '/kaniko/executor -f ./Dockerfile -c $(pwd) --reproducible --tarPath=JenkinsAndroidSDKAgent.tar --destination=android-agent --no-push'
                archiveArtifacts 'JenkinsAndroidSDKAgent.tar'
              }
            }
        }
    }
}