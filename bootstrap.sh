#!/usr/bin/env bash

sudo apt-get update     
sudo apt-get install -y curl
sudo apt-get install -y redis-server
sudo apt-get install -y rabbitmq-server
sudo apt-get install -y build-essential

#
# Installs POSTGRES
#
sudo apt-get install -y postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres psql -c "ALTER USER vagrant PASSWORD 'vagrant';"
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres'; "
sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest
sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest2sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest
sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest2

#
# Installs RVM
#
sudo apt update
sudo apt install gnupg2
gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io -o rvm.sh
nano rvm.sh
cat rvm.sh | bash -s stable --rails
source ~/.rvm/scripts/rvm

#
# Install Ruby 2.1.x in RVM
#
rvm install 2.6.4
rvm use 2.6.4

#
# Enable RabbitMQ Menagement
#
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl add_user admin admin
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"