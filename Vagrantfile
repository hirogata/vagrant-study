# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"

  config.vm.define "lb" do |lb|
    lb.vm.network "private_network", ip: "192.168.2.11"
    lb.vm.provision :chef_solo do |chef|
      chef.add_recipe "nginx-app"
      chef.add_recipe "nginx-app::lb"
    end
  end

  config.vm.define "web1" do |web1|
    web1.vm.network "private_network", ip: "192.168.2.21"
    web1.vm.provision :chef_solo do |chef|
      chef.add_recipe "nginx-app"
      chef.add_recipe "nginx-app::web"
      chef.json = { name: "web1" }
    end
  end

  config.vm.define "web2" do |web2|
    web2.vm.network "private_network", ip: "192.168.2.22"
    web2.vm.provision :chef_solo do |chef|
      chef.add_recipe "nginx-app"
      chef.add_recipe "nginx-app::web"
      chef.json = { name: "web2" }
    end
  end
end
