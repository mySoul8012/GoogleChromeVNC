FROM dorowu/ubuntu-desktop-lxde-vnc

# 暴露 VNC 和 Web 服务端口
EXPOSE 5901 6080

# 启动命令：运行 VNC 服务和 Web 服务
CMD ["/bin/bash", "-c", "/usr/bin/vncserver :1 -geometry 1280x800 -depth 24; tail -f /dev/null"]
