FROM jenkins
# Add Android SDK
RUN wget --progress=dot:giga https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN mv android-sdk_r24.4.1-linux.tgz /opt/
RUN cd /opt && tar xzvf ./android-sdk_r24.4.1-linux.tgz
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
RUN echo $PATH
RUN echo "y" | android update sdk -u --filter platform-tools,android-22,android-23,build-tools-23.0.2,build-tools-23.0.3,addon-google_apis-google-23,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services
RUN chmod -R 755 $ANDROID_HOME
# if we want to install via apt
# USER root
# drop back to the regular jenkins user - good practice
# USER jenkins
