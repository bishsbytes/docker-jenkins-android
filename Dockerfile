FROM jenkins
# Add Android SDK
USER root
RUN apt-get update && apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip
# ADD https://services.gradle.org/distributions/gradle-2.4-all.zip $JENKINS_HOME
# RUN unzip $JENKINS_HOME/gradle-2.4-all.zip -d $JENKINS_HOME/gradle
# ENV GRADLE_HOME $JENKINS_HOME/gradle/gradle-2.4-all
# ENV PATH $GRADLE_HOME/bin:$PATH
# RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
# RUN mv android-sdk_r24.4.1-linux.tgz /opt/
# RUN cd /opt && tar xzvf ./android-sdk_r24.4.1-linux.tgz
ENV ANDROID_HOME $JENKINS_HOME/android-sdk-linux
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
# RUN echo $PATH
# RUN echo "y" | android update sdk -u --filter platform-tools,android-22,android-23,build-tools-23.0.2,build-tools-23.0.3,addon-google_apis-google-23,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services
# RUN chmod -R 755 $ANDROID_HOME
USER jenkins
# if we want to install via apt
# USER root
# drop back to the regular jenkins user - good practice
# USER jenkins
