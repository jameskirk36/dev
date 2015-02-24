# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |v|
    v.name = "dev-env"
    v.memory = 1024
    v.cpus = 1
  end
  config.vm.hostname = "dev-env"
  config.vm.provision :file, source: "./home/vim", destination: "~/.vim"
  config.vm.provision :file, source: "./home/vimrc", destination: "~/.vimrc"
end
