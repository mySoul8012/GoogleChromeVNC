# **Docker-Firefox 中文版**

这是一个基于 [jlesage/firefox](https://hub.docker.com/r/jlesage/firefox) 的定制化 Docker 镜像，主要功能是运行支持中文显示的 Firefox 浏览器，并通过 Web 界面进行访问。

---

## **功能特点**
- **轻量化**: 使用 Alpine Linux 作为底层，资源占用少。
- **中文支持**: 预装了中文字体（文泉驿），适用于中文网页。
- **Web 界面访问**: 无需在本地安装 Firefox，通过浏览器即可访问。
- **多语言支持**: 默认语言设置为中文简体 (zh_CN)。

---

## **使用方法**

### 1. **拉取镜像**
```bash
docker pull your-repo-name/firefox-chinese
```

### 2. **运行容器**
```bash
docker run -d -p 5800:5800 your-repo-name/firefox-chinese
```

### 3. **访问 Web 界面**
- 打开浏览器，访问 `http://<你的服务器 IP>:5800`。

---

## **技术实现**

1. **基础镜像**: 使用 [jlesage/firefox] 镜像。
2. **中文支持**:
   - 安装了 `wqy-zenhei` 字体（文泉驿）。
   - 配置默认语言为中文简体 (zh_CN)。
3. **依赖安装**: 通过 `apk` 安装以下依赖：
   - **wqy-zenhei**: 中文字体支持。
   - **xorg-server**: 图形界面服务器。
   - **xclip**: 提供剪贴板功能支持。
4. **端口设置**: 暴露 `5800` 端口用于 Web 界面访问。

---

## **环境变量**
- `LANG=zh_CN.UTF-8`: 设置系统语言为中文简体。
- `LANGUAGE=zh_CN:zh`: 配置语言环境优先使用中文。
- `LC_ALL=zh_CN.UTF-8`: 设置本地化配置为中文。

---

## **系统需求**
- Docker 环境：20.10 或更高版本。
- 推荐操作系统：Linux/Windows/macOS。

---

## **贡献与支持**

欢迎提交 issue 和 PR 来改进此项目！如需帮助，请联系开发者或访问 [官方文档](https://hub.docker.com/r/jlesage/firefox)。

---

## **许可证**

本项目基于 [MIT 许可证](LICENSE)。
