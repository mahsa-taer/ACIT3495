FROM centos:latest
RUN yum install httpd -y && yum install php -y && yum install net-tools -y
COPY index.html /var/www/html
EXPOSE 80
CMD /usr/sbin/httpd -DFOREGROUND
