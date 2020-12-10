# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/groovy64' # 20.10
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 5432, host: 5432 # postgresql
  config.vm.network :forwarded_port, guest: 6379, host: 6379 # redis

  config.vm.network :forwarded_port, guest: 5672, host: 5672 # rails app
  config.vm.network :forwarded_port, guest: 15672, host: 15672 # rabbitmq
  config.vm.network :forwarded_port, guest: 25672, host: 25672 # rabbitmq

  config.vm.network :forwarded_port, guest: 3000, host: 3000 # rails app
  config.vm.network :forwarded_port, guest: 1443, host: 1443 # rails app

  config.vm.network :forwarded_port, guest: 1234, host: 1234 # rails app


  config.vm.network "private_network", ip: "192.168.33.10"

  config.ssh.forward_agent = true


  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.ssh.extra_args = ["-t", "cd /vagrant; bash --login;"]

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end
