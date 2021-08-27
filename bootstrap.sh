#!/usr/bin/env bash

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

# Prevents "Warning: apt-key output should not be parsed (stdout is not a terminal)".
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo -E apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo updating package information
apt-get -y update >/dev/null 2>&1

# install Ruby ruby-full bundler
# install 'development tools' build-essential autoconf libtool

# echo installing current RubyGems
gem update --system -N >/dev/null 2>&1

install Git git
install SQLite sqlite3 libsqlite3-dev
install memcached memcached
install Redis redis-server
install RabbitMQ rabbitmq-server

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres psql -c "ALTER USER vagrant PASSWORD 'vagrant';"
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres'; "
sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest
sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest2sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest
sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest2

# curl -sSL https://get.rvm.io | bash -s $1
sudo apt-get install -y build-essential
#
# Installs RVM
#
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg --import -
sudo curl -sSL https://get.rvm.io | bash -s stable
sudo su
source /etc/profile.d/rvm.sh
#
# Install Ruby 2.6.0 in RVM
#
rvm install 2.6.0
rvm use 2.6.0

echo 'INSTALA O RUBY COM O RVM QUE É SUCESSO'
echo 'A festa começa aqui, vamo balançar!!!'
