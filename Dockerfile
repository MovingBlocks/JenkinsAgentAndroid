FROM jenkins/inbound-agent

RUN mkdir -p /opt/android-sdk/cmdline-tools &&\
wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip &&\
unzip commandlinetools-linux-7583922_latest.zip -d /opt/android-sdk/cmdline-tools &&\
rm commandlinetools-linux-7583922_latest.zip &&\
mv /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest &&\
mkdir /opt/android-sdk/licenses &&\
printf "\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > /opt/android-sdk/licenses/android-sdk-license