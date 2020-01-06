FROM centos:6.6
MAINTAINER ucub <yusufsanjaya@gmail.com>
RUN yum -y update; yum clean all
RUN yum install -y yum-utils; yum clean all
RUN yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-mysqli php-dba\
                  php-ldap php-zip php-fileinfo php-common php-soap php-ctype php-date\
                  php-bcmath php-xmlrpc php-pdo php-mbstring php-pear php-calendar \
                  php-process php-intl php-bz2 php-xml php-opcache; yum clean all

ADD php.ini /etc/
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
EXPOSE 80 443
CMD exec /usr/sbin/httpd -D FOREGROUND
