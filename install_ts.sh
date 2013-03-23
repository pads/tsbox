#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

#
# Setup TiddlyWeb user
#
groupadd tiddlyweb
useradd -s /bin/bash -m -g tiddlyweb tiddlyweb
echo "%tiddlyweb ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#
# Install dependencies
#
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu lucid main" >> /etc/apt/sources.list

apt-get -q update

apt-get -q -y install wget mlocate chkconfig gcc libyaml-dev libev-dev git-core python-dev python-distribute python-pip nodejs memcached beanstalkd libapache2-mod-wsgi mysql-client libmysqlclient-dev mysql-server

#
# Install TiddlySpace
#
pip install -U setuptools
pip install -U tiddlywebwiki
pip install -U PyYAML
pip install -U tiddlywebplugins.tiddlyspace

#
# Create and configure the database
#
mysql -u root < /vagrant/setup_db.sql

#
# Create a TiddlySpace insance
#
cd /home/tiddlyweb
su - tiddlyweb -c "tiddlyspace tiddlyspace_instance"
cd tiddlyspace_instance

cp /vagrant/tiddlywebconfig.py .
chown tiddlyweb.tiddlyweb tiddlywebconfig.py

wget http://github.com/tiddlyweb/tiddlyweb/raw/master/apache.py
chown tiddlyweb.tiddlyweb apache.py

su - tiddlyweb -c "twanager update"

#
# Configure a virtual host for apache
#
echo "ServerName tsbox.com" >> /etc/apache2/apache2.conf
cp /vagrant/ts_host.conf /etc/apache2/sites-available/ts_host
a2ensite ts_host
/etc/init.d/apache2 restart

echo "Done!"