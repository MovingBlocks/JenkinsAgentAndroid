FROM jenkins/inbound-agent

USER root

ENV ANDROID_SDK_ROOT=/opt/android-sdk

RUN apt-get update && apt-get install -y ruby ruby-dev build-essential \
&& gem install --no-document fastlane \
&& apt-get purge -y ruby-dev build-essential && apt-get autoremove -y

RUN mkdir -p /opt/android-sdk/cmdline-tools \
&& /busybox/wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip \
&& /busybox/unzip commandlinetools-linux-7583922_latest.zip -d /opt/android-sdk/cmdline-tools \
&& rm commandlinetools-linux-7583922_latest.zip \
&& mv /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest \
&& mkdir /opt/android-sdk/licenses \
&& printf "\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > /opt/android-sdk/licenses/android-sdk-license \
&& /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "build-tools;30.0.3" "platforms;android-30" \
&& chown -R jenkins:jenkins /opt/android-sdk

USER jenkins
