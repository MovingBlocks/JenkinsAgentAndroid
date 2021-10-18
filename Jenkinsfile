String deduceDockerTag() {
    String dockerTag = env.BRANCH_NAME
    if (dockerTag.equals("main")) {
        dockerTag = "latest"
    } else {
        dockerTag += env.BUILD_NUMBER
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
                    sh """
                        echo -n $DOCKER_CRED | base64 > token
                        tokenVar=\$(cat token)
                        sed -i "s/PLACEHOLDER/\$tokenVar/g" config.json
                        cp config.json /kaniko/.docker/config.json
                        /kaniko/executor -f ./Dockerfile -c \$(pwd) --reproducible --destination=terasology/jenkins-android-agent:$DOCKER_TAG
                    """
                }
            }
        }
    }
}
