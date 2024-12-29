FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:99 \
    VNC_PASSWORD=password \
    DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=720 \
    NOVNC_PORT=6080

# 安装必要依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl git procps supervisor x11vnc xvfb fluxbox python3-pip \
    x11-utils xmessage fonts-dejavu fonts-liberation fonts-noto && \
    mkdir -p /root/.fluxbox && cp -r /etc/X11/fluxbox/* /root/.fluxbox/ && \
    git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 6080

CMD ["/usr/local/bin/start.sh"]
