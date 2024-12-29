#!/bin/bash
export DISPLAY=${DISPLAY}
Xvfb ${DISPLAY} -screen 0 ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x24 &\n
fluxbox &\n
x11vnc -display ${DISPLAY} -forever -usepw &\n
/usr/bin/python3 /opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen ${NOVNC_PORT} &
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf
