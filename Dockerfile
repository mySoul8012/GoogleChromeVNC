FROM debian:bullseye

# 更新包并安装必要依赖
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxtst6 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnss3 \
    libasound2 \
    libxrandr2 \
    libpangocairo-1.0-0 \
    libpango-1.0-0 \
    x11-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 下载 Min 浏览器
RUN wget https://github.com/minbrowser/min/releases/latest/download/min.deb -O /tmp/min.deb \
    && dpkg -i /tmp/min.deb || apt-get install -y --fix-broken \
    && rm /tmp/min.deb

# 添加用户以非 root 身份运行浏览器
RUN useradd -m user \
    && chown -R user:user /home/user

USER user
WORKDIR /home/user

# 暴露端口
EXPOSE 8080

# 设置浏览器启动命令
ENTRYPOINT ["min"]
