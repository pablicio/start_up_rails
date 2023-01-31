# -*- mode: ruby -*-
# vi: set ft=ruby :
# DESATIVA O HYPER-V!!!!!!!!!!!!!!!!!!!!!
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/focal64' # 20.04
  config.vm.hostname = 'rails-dev-box'
  config.vm.network :forwarded_port, guest: 5432, host: 5432 # postgresql
  config.vm.network :forwarded_port, guest: 6379, host: 6379 # redis
  config.vm.network :forwarded_port, guest: 5672, host: 5673 # rails app
  config.vm.network :forwarded_port, guest: 15672, host: 15673 # rabbitmq
  config.vm.network :forwarded_port, guest: 25672, host: 25673 # rabbitmq
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # rails app
  config.vm.network :forwarded_port, guest: 1443, host: 1443 # rails app
  config.vm.network :forwarded_port, guest: 1080, host: 1080 # mailcatcher
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true
  config.vm.provision :shell, privileged: false, path: 'bootstrap.sh', keep_color: true
  config.ssh.extra_args = ["-t", "cd /vagrant; bash --login;"]
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end
