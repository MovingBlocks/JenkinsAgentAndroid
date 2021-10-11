pipeline {
    agent {
        label 'kaniko'
    }

    stages {
        stage('Build') {
            steps {
              container('kaniko') {
                sh '/kaniko/executor -f ./Dockerfile -c $(pwd) --reproducible --tarPath=JenkinsAndroidSDKAgent.tar --destination=image --no-push'
                archiveArtifacts 'JenkinsAndroidSDKAgent.tar'
              }
            }
        }
    }
}