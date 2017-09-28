FROM java:openjdk-8-alpine
RUN apk --no-cache add wget
RUN wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.der -O /tmp/lets-encrypt.der
RUN keytool -importcert -alias local-CA \
        -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts \
        -file /tmp/lets-encrypt.der \
        -storepass changeit
ADD jenkins-cli.jar /opt/src/
