#!/bin/bash
echo "====================instalando dependencias=========================="
apt-get install -y build-essential git python-dev mongodb redis-server libxml2-dev libxslt-dev zlib1g-dev python-virtualenv wkhtmltopdf
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
rm yeti/
 git clone https://github.com/yeti-platform/yeti.git
echo "====================yeti clonado====================================="
echo "====================instalando pip==================================="
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
echo "====================pip instalado o actualizado======================"
echo "====================instalando requerimientos de yeti================"
cd yeti/
pip install -r requirements.txt
yarn install
echo "====================requerimientos instalados========================"
echo "								   "
echo "                                                             "
echo "                                                             "
echo "====================para levantar el servidor yeti ejecutar yeti.py=="
