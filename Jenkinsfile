pipeline {
    agent {
        label 'kaniko'
    }

    stages {
        stage('Build') {
            steps {
              sh '/kaniko/executor -f ./Dockerfile -c $(pwd) --cache=true --reproducible --tarPath=JenkinsAndroidSDKAgent.tar --destination=image --no-push'
              archiveArtifacts 'JenkinsAndroidSDKAgent.tar'
            }
        }
    }
}