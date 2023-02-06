FROM  centos:7
MAINTAINER vinaymgb@gmail.com

RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all

WORKDIR /var/www/html/

RUN curl -O https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
