# -*- mode: ruby -*-
# vi: set ft=ruby :

# libvirt provider may not create the port forwarding tunnels for apache and mysql
# Create with:
# vagrant ssh -- -f -N -L 8080:localhost:80

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "yacomas.local"

  forward_port = ->(guest, host = guest) do
    config.vm.network :forwarded_port,
      guest: guest,
      host: host,
      auto_correct: true
  end

  forward_port[80, 8080]   # apache

  config.vm.provision "disable-ipv6", type: "shell", inline: <<-SHELL
    echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
    echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
    # Apply changes immediately
    sysctl -p
    # Optional: comment out the ipv6 loopback address in /etc/hosts to prevent issues
    sed -i 's/::1/# ::1/' /etc/hosts
  SHELL

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path  = "modules"
    puppet.manifest_file = "default.pp"
  end

end
