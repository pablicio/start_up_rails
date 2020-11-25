#!/usr/bin/env bash

# adding the Node.js and Yarn repositories
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

# default packages
sudo apt-get upgrade -y
sudo apt-get install -y --force-yes --no-install-recommends git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# rbenv & ruby
sudo -u vagrant git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
sudo -u vagrant echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
sudo -u vagrant -i exec $SHELL

sudo -u vagrant git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/vagrant/.bashrc
sudo -u vagrant -i exec $SHELL

# no rdoc for installed gems
sudo -u vagrant echo 'gem: --no-document' >> /home/vagrant/.gemrc

# install ruby
sudo -u vagrant -i /home/vagrant/.rbenv/bin/rbenv install 2.6.0
sudo -u vagrant -i /home/vagrant/.rbenv/bin/rbenv global 2.6.0
sudo -u vagrant -i /home/vagrant/.rbenv/versions/2.6.0/bin/gem install bundler --no-document
sudo -u vagrant -i /home/vagrant/.rbenv/versions/2.6.0/bin/bundle config git.allow_insecure true


# rehash
sudo -u vagrant -i /home/vagrant/.rbenv/bin/rbenv rehash

# postgresql
sudo apt-get install -y postgresql postgresql-client postgresql-contrib libpq-dev
sudo sh -c "echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.*/main/pg_hba.conf"
sudo -u postgres psql -c "CREATE USER vagrant SUPERUSER;"
sudo -u postgres psql -c "CREATE DATABASE vagrant_development OWNER vagrant;"
sudo -u postgres psql -c "CREATE DATABASE vagrant_test OWNER vagrant;"

# redis
sudo apt-get install -y build-essential tcl
sudo add-apt-repository ppa:chris-lea/redis-server -y && sudo apt-get update && sudo apt-get install -y redis-server

echo "-----> 👍"
