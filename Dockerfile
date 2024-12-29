FROM ubuntu:20.04

# 环境变量配置
ENV DEBIAN_FRONTEND=noninteractive

# 更新系统并安装必要的依赖
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    default-jdk \
    mysql-client \
    libmysql-java \
    supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 下载和安装 Guacamole Server
RUN apt-get install -y build-essential libcairo2-dev libjpeg62-turbo-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev \
    && wget https://apache.org/dyn/closer.lua/guacamole/1.5.0/source/guacamole-server-1.5.0.tar.gz -O guacamole-server.tar.gz \
    && tar -xzf guacamole-server.tar.gz \
    && cd guacamole-server-1.5.0 \
    && ./configure --with-init-dir=/etc/init.d \
    && make \
    && make install \
    && ldconfig \
    && cd .. \
    && rm -rf guacamole-server.tar.gz guacamole-server-1.5.0

# 下载和配置 Guacamole Web 应用程序
RUN mkdir -p /etc/guacamole \
    && wget https://apache.org/dyn/closer.lua/guacamole/1.5.0/binary/guacamole-1.5.0.war -O /etc/guacamole/guacamole.war \
    && ln -s /etc/guacamole/guacamole.war /usr/share/tomcat9/webapps/guacamole.war

# 安装 Tomcat
RUN apt-get install -y tomcat9 \
    && systemctl enable tomcat9

# 配置 Guacamole
COPY guacamole.properties /etc/guacamole/guacamole.properties
RUN ln -s /etc/guacamole /usr/share/tomcat9/.guacamole

# Supervisor 配置
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 暴露端口
EXPOSE 8080

# 启动服务
CMD ["/usr/bin/supervisord"]
