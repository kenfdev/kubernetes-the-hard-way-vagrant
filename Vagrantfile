# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end

  # must be at the top
  config.vm.define "lb-0" do |c|
      c.vm.hostname = "lb-0"
      c.vm.network "private_network", ip: "10.240.0.40"

      c.vm.provision :shell, :path => "scripts/bootstrap/vagrant-setup-haproxy.sh"

      c.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  (0..2).each do |n|
    config.vm.define "controller-#{n}" do |c|
        c.vm.hostname = "controller-#{n}"
        c.vm.network "private_network", ip: "10.240.0.1#{n}"

        c.vm.provision :shell, :path => "scripts/bootstrap/vagrant-setup-hosts-file.sh"
    end
  end

  (0..2).each do |n|
    config.vm.define "worker-#{n}" do |c|
        c.vm.hostname = "worker-#{n}"
        c.vm.network "private_network", ip: "10.240.0.2#{n}"

        c.vm.provision :shell, :path => "scripts/bootstrap/vagrant-setup-routes.sh"
        c.vm.provision :shell, :path => "scripts/bootstrap/vagrant-setup-hosts-file.sh"
    end
  end

end