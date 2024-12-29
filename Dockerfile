FROM dorowu/ubuntu-desktop-lxde-vnc

# 暴露 VNC 和 Web 端口
EXPOSE 5901 6080

# 启动容器时运行 VNC 服务
CMD ["/bin/bash", "/startup.sh"]
