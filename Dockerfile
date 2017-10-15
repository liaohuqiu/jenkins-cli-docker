FROM java:openjdk-8-alpine
RUN apk --no-cache add wget
RUN wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.der -O /tmp/lets-encrypt.der
RUN keytool -importcert -alias local-CA \
        -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts \
        -file /tmp/lets-encrypt.der \
        -storepass changeit

WORKDIR /opt/src

COPY jenkins-cli.jar /opt/src/
COPY jenkins-cli /bin/jenkins-cli

ENV JENKINS_URL ""
ENV PRIVATE_KEY "/ssh/id_rsa"
VOLUME /ssh
