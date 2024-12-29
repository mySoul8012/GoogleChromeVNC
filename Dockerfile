FROM jlesage/firefox

# 安装中文字体支持
RUN apt-get update && apt-get install -y fonts-wqy-zenhei fonts-wqy-microhei && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 设置 Firefox 默认语言为中文
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

# 启用剪贴板支持
RUN apt-get update && apt-get install -y xclip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 暴露端口用于 Web 访问
EXPOSE 5800

# 启动命令
CMD ["/init"]
