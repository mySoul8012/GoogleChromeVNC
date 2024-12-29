FROM jlesage/firefox

# 暴露端口用于 Web 访问
EXPOSE 5800

# 启动命令
CMD ["/init"]
