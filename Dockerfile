# Use a lightweight Debian image as the base
FROM debian:bullseye-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:99 \
    VNC_PASSWORD=password \
    DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=720 \
    NOVNC_PORT=6080

# Update package manager and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        xvfb \
        x11vnc \
        fluxbox \
        supervisor \
        fonts-droid-fallback \
        git \
        net-tools \
        procps \
        python3 \
        python3-pip \
        locales && \
    # Install Google Chrome
    wget -qO /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y --no-install-recommends /tmp/google-chrome.deb && \
    rm /tmp/google-chrome.deb && \
    # Install noVNC
    git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html && \
    # Clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

# Copy supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports for noVNC
EXPOSE ${NOVNC_PORT}

# Copy startup script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Set the command to execute the startup script
CMD ["/usr/local/bin/start.sh"]
