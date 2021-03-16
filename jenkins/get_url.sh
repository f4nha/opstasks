#!/bin/bash

echo "Start Jenkins"

sudo docker start jenkins \
	&& echo "Wait for a while ..." \
	&& sleep 15 \
	&& echo

IP=$(curl -s 'https://api.ipify.org?format=json' | jq -r '.ip')

printf 'Jenkins url: http://%s/\n' ${IP}

JENKINS_HOME=/opt/local/jenkins
USERNAME=$(
        sudo jenkins-credentials-decryptor   \
                -m $JENKINS_HOME/secrets/master.key   \
                -s $JENKINS_HOME/secrets/hudson.util.Secret   \
                -c $JENKINS_HOME/credentials.xml   \
                -o json | jq -r '.[].username')
PASSWORD=$(
        sudo jenkins-credentials-decryptor   \
                -m $JENKINS_HOME/secrets/master.key   \
                -s $JENKINS_HOME/secrets/hudson.util.Secret   \
                -c $JENKINS_HOME/credentials.xml   \
                -o json | jq -r '.[].password')

printf 'username: %s\npassword: %s\n' ${USERNAME} ${PASSWORD}


