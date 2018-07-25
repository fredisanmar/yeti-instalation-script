#!/bin/bash
cp -r systemd/ /
echo "====================instalando dependencias=========================="
apt-get install build-essential git python-dev mongodb redis-server libxml2-dev libxslt-dev zlib1g-dev python-virtualenv python-pip nginx yarn -y
rm /var/lib/mongodb/mongod.lock
service mongodb restart
echo "====================dependencias instaladas=========================="
echo "====================instalando curl=================================="
apt-get install curl
echo "====================curl inatalado==================================="
apt-get install -y apt-transport-https 
echo "====================instalando yarn=================================="
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list
apt-get update &&  apt-get install -y yarn 
echo "====================yarn instalado==================================="
echo "====================clonando yeti===================================="
cd /
rm -r /yeti
cd /
 git clone https://github.com/yeti-platform/yeti.git
 mv systemd/ /yeti
echo "====================yeti clonado====================================="
echo "====================instalando pip==================================="
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
echo "====================pip instalado o actualizado======================"
echo "====================instalando requerimientos de yeti================"
cd /yeti
pip install -r requirements.txt
rm -r extras/systemd/
chmod 666 systemd/ -R
mv systemd/ extras/
pip install uwsgi
yarn install

echo "====================creando servicios================================"
useradd yeti
cp extras/systemd/*.service /etc/systemd/system/
systemctl enable yeti_uwsgi.service
systemctl enable yeti_oneshot.service
systemctl enable yeti_feeds.service
systemctl enable yeti_exports.service
systemctl enable yeti_analytics.service
systemctl enable yeti_beat.service
systemctl daemon-reload
chown -R yeti:yeti /yeti
chmod +x /yeti/yeti.py
#
#
#
rm -r /etc/nginx/sites-enabled/default
cp extras/nginx/yeti /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/yeti /etc/nginx/sites-enabled/yeti
service nginx restart
echo "====================requerimientos instalados========================"
echo "								   "
echo "                                                             "
echo "                                                             "
echo "====================para levantar el servidor yeti ejecutar yeti.py=="
