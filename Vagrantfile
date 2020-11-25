# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.55.200"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.provision :shell, path: "build/provision.sh"
  config.vm.provision :shell, path: "build/rabbitmq.sh"
  config.vm.provision :shell, path: "build/user.sh"


  config.ssh.extra_args = ["-t", "cd /vagrant; bash --login"]

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end
