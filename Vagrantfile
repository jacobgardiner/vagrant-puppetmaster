# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  config.vm.box = "sl6-base"
  config.vm.box_url = "https://jgsyd.s3.amazonaws.com/vagrant/sl6-base.box"
  config.vm.hostname ="dev.puppet.local"


  # Network config
  #config.vm.network "public_network"
  config.vm.network :private_network, ip: "192.168.56.103"
  
  config.ssh.forward_agent = true
  #config.vm.synced_folder "shared/", "/vagrant/shared", owner: "root", group: "root"

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
  end 


  # Run the install
  config.vm.provision :shell, :path => "install-master.sh"

  config.vm.provision :puppet, :module_path => "puppetconf/modules", :manifests_path => "puppetconf/manifests", :manifest_file  => "default.pp"

  config.vm.synced_folder "puppet/manifests", "/etc/puppet/manifests"
  config.vm.synced_folder "puppet/modules", "/etc/puppet/modules"
  config.vm.synced_folder "puppet/hieradata", "/etc/puppet/hieradata"

end
