FROM ubuntu:16.04


# Install "software-properties-common" (for the "add-apt-repository")
RUN apt-get update && apt-get install -y \
    software-properties-common \
    apt-transport-https

# Add the "JAVA" ppa (installs Oracle JDK 10 & JRE for Linux)
RUN add-apt-repository -y \
    ppa:webupd8team/java

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk \
    ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Install sshd service & configure password requirements
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN echo 'root:jenkins123'| chpasswd

# Without this option, jenkins master cannot login to slave with password (only with key)
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Install Kubectl using native package
RUN apt-get install -y apt-transport-https gnupg2 curl 
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

# Install kubectl using binary package
# RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# RUN chmod +x ./kubectl
# RUN mv ./kubectl /usr/local/bin/kubectl

RUN mkdir /root/.kube/
COPY files/config /root/.kube

# Setting home directory for jenkins master to run commands
RUN mkdir /root/jenkins/

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
