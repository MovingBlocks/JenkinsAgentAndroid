String deduceDockerTag() {
    String dockerTag = env.BRANCH_NAME
    if (dockerTag.equals("main")) {
        echo "Building the 'main' branch so we'll publish as the 'latest' Docker tag"
        dockerTag = "latest"
    } else {
        dockerTag += env.BUILD_NUMBER
        echo "Building a branch other than 'main' so will publish as $dockerTag, not 'latest'"
    }
    return dockerTag
}    

pipeline {
    agent {
        label 'kaniko'
    }
    
    environment {
        DOCKER_CRED = credentials('docker-hub-cervator-token')
        DOCKER_TAG = deduceDockerTag()
    }

    stages {
        stage('Build') {
            steps {
                container('kaniko') {
                    git 'https://github.com/Cervator/JenkinsAndroidSDKAgent.git'
                    sh '''
                        set +x
                        tokenVar=$(echo -n $DOCKER_CRED | base64) > out.log 2>&1
                        sed -i "s/PLACEHOLDER/$tokenVar/g" config.json > out.log 2>&1
                        set -x
                        cp config.json /kaniko/.docker/config.json
                        /kaniko/executor -f ./Dockerfile -c $(pwd) --reproducible --destination=terasology/jenkins-android-agent:$DOCKER_TAG
                    '''
                }
            }
        }
    }
}
