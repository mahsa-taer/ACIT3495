FROM centos:latest
RUN yum install httpd -y
RUN yum install php -y
CMD /usr/sbin/httpd -DFOREGROUND
RUN yum install net-tools -y
EXPOSE 80
COPY index.html /var/www/html
