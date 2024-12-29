FROM jlesage/firefox

# 安装中文字体支持
RUN apk update && apk add --no-cache \
    wqy-zenhei \
    xorg-server \
    xclip

# 设置 Firefox 默认语言为中文
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

# 暴露端口用于 Web 访问
EXPOSE 5800

# 启动命令
CMD ["/init"]
