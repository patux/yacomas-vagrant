# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  forward_port = ->(guest, host = guest) do
    config.vm.network :forwarded_port,
      guest: guest,
      host: host,
      auto_correct: true
  end

  forward_port[1080]      # mailcatcher 
  forward_port[3306]      # mysql 
  forward_port[80, 8080]  # nginx/apache

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path  = "modules"
    puppet.manifest_file = "default.pp"
  end

end
