FROM dorowu/ubuntu-desktop-lxde-vnc

# 替换源为国内源（以阿里云为例）
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y firefox && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 启动命令：运行 VNC 服务和 Web 服务
CMD ["/bin/bash", "-c", "/usr/bin/vncserver :1 -geometry 1280x800 -depth 24; tail -f /dev/null"]
