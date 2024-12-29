# 使用 Windows Server Core 基础镜像
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# 安装必要的工具和 RDP 服务
RUN powershell -Command \
    Install-WindowsFeature -Name RDS-RD-Server; \
    Install-WindowsFeature -Name RDS-Licensing; \
    Install-WindowsFeature -Name RDS-Connection-Broker

# 创建用户并设置密码
RUN net user rdpuser Password123! /add && net localgroup "Remote Desktop Users" rdpuser /add

# 开启远程桌面服务
RUN reg add "HKLM\\System\\CurrentControlSet\\Control\\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

# 暴露 RDP 默认端口
EXPOSE 3389

# 启动 RDP 服务
CMD ["powershell", "-Command", "Start-Service -Name TermService; Wait-Event -Timeout Infinite"]
