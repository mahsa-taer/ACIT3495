FROM jenkins/jenkins:lts

USER root

# Install prerequisities
RUN apt-get update && \
    apt-get -y install curl \
    sudo \
    wget \
    gnupg2 \
    net-tools \
    iputils-ping \
    ca-certificates \
    apt-transport-https \
    software-properties-common

# Create jenkins user home directory
RUN mkdir -p /home/jenkins 
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

# Install java
RUN apt-get update && \
    apt-get -y install docker-ce \
    default-jre \
    openjdk-11-jdk

# Grant sudo privileges to the jenkins user
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Adding the user to docker group
RUN usermod -aG docker jenkins
RUN chown -R jenkins:jenkins /var/jenkins_home
RUN chown -R jenkins:jenkins /home/jenkins

USER jenkins
