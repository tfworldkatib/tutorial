# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "minikatib/tfworld"
  config.vm.box_version = "0.2.0"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 31230, host: 31230, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
     vb.cpus = "4"
  end

  config.vm.provision "shell", 
    inline: "cd /home/vagrant/tfworld/setup/k8s-config/ && ./start-k8s.sh",
    privileged: false

end
