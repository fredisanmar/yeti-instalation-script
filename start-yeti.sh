#!/bin/bash

base64 -d <<<"ICAgICBfICAgICAgICAgICAgIF8gICBfICAgICAgICAgICAgICAgICAgICAgICAgICBfICAgXyAKIF9fX3wgfF8gX18gXyBfIF9ffCB8XyhfKV8gX18gICBfXyBfICAgXyAgIF8gIF9fX3wgfF8oXykKLyBfX3wgX18vIF9gIHwgJ19ffCBfX3wgfCAnXyBcIC8gX2AgfCB8IHwgfCB8LyBfIFwgX198IHwKXF9fIFwgfHwgKF98IHwgfCAgfCB8X3wgfCB8IHwgfCAoX3wgfCB8IHxffCB8ICBfXy8gfF98IHwKfF9fXy9cX19cX18sX3xffCAgIFxfX3xffF98IHxffFxfXywgfCAgXF9fLCB8XF9fX3xcX198X3wKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxfX18vICAgfF9fXy8gICAgICAgICAgICA="
echo " "
servie nginx start
systemctl start mongodb.service
systemctl start yeti_oneshot.service
sleep 5
systemctl start yeti_feeds.service
systemctl start yeti_exports.service
systemctl start yeti_analytics.service
systemctl start yeti_beat.service
systemctl start yeti_uwsgi.service
echo "[+] Yeti succesfully started. Listening on <your ip>:80"
