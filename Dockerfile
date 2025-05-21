FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    pip3 install pytest

USER jenkins
