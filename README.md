A simple Android build agent prepared for Jenkins

## Technical details

This image is built via [Kaniko](https://github.com/GoogleContainerTools/kaniko) in the [Terasology](https://terasology.org/) Jenkins with a Docker agent labeled `kaniko` - see our https://github.com/MovingBlocks/InfraPlayground repo for further details on that setup, if you have access.

It uses a multi-branch job that lets different branches publish images to [DockerHub](https://hub.docker.com/repository/docker/terasology/jenkins-android-agent) with their own unique tag. The `main` branch is special and publishes the `latest` image.

Initial credits go to our contributor BSA with original work at https://github.com/BenjaminAmos/DestinationSol/pull/1
