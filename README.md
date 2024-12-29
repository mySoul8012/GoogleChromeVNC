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

---

# **Docker-Firefox (English Version)**

This is a customized Docker image based on [jlesage/firefox](https://hub.docker.com/r/jlesage/firefox), designed to run a Firefox browser with Chinese language support and accessible through a web interface.

---

## **Features**
- **Lightweight**: Built on Alpine Linux, ensuring minimal resource usage.
- **Chinese Support**: Pre-installed with Chinese fonts (WenQuanYi Zen Hei), suitable for browsing Chinese websites.
- **Web Interface**: Access Firefox via a browser without local installation.
- **Multi-language Support**: Default language set to Simplified Chinese (zh_CN).

---

## **Usage**

### 1. **Pull the Image**
```bash
docker pull your-repo-name/firefox-chinese
```

### 2. **Run the Container**
```bash
docker run -d -p 5800:5800 your-repo-name/firefox-chinese
```

### 3. **Access the Web Interface**
- Open your browser and navigate to `http://<your server IP>:5800`.

---

## **Technical Details**

1. **Base Image**: Built on [jlesage/firefox] image.
2. **Chinese Support**:
   - Installed `wqy-zenhei` font (WenQuanYi Zen Hei).
   - Configured default language to Simplified Chinese (zh_CN).
3. **Dependencies**: Installed the following via `apk`:
   - **wqy-zenhei**: Chinese font support.
   - **xorg-server**: Graphical server.
   - **xclip**: Clipboard support.
4. **Port Exposure**: Exposes port `5800` for web interface access.

---

## **Environment Variables**
- `LANG=zh_CN.UTF-8`: Sets system language to Simplified Chinese.
- `LANGUAGE=zh_CN:zh`: Configures language priority to Chinese.
- `LC_ALL=zh_CN.UTF-8`: Sets localization to Chinese.

---

## **System Requirements**
- Docker: Version 20.10 or higher.
- Recommended OS: Linux/Windows/macOS.

---

## **Contribution & Support**

Feel free to submit issues and PRs to improve this project! For assistance, contact the developers or visit the [official documentation](https://hub.docker.com/r/jlesage/firefox).

---

## **License**

This project is licensed under the [MIT License](LICENSE).
