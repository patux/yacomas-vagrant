vagrant-yacomas dev environment
===============================

Environment based on: <https://github.com/sapienza/vagrant-php-box>

Set up super fast a PHP5 YaCOMAS development box with apache, mysql, phpmyadmin and whatever else that you may need

## How to run

* Install vagrant using the installation instructions in the [Getting Started document](https://docs.vagrantup.com/v2/getting-started/)
* Clone this repository using git clone --recursive
* run vagrant up
* Go to <http://localhost:8080/yacomas> and enjoy!
* YaCOMAS admin panel: <http://localhost:8080/yacomas/admin>

PS: I receive several emails asking me which is the phpmyadmin's login and password, it is pretty easy to find out inside its docs... but, here it is:
login: root
password: root

## Included components

* php5
* apache2
* php5-cli
* php5-xdebug
* php5-mysql
* php5-imagick
* php5-mcrypt
* php-pear
* php5-dev
* php5-curl
* php5-sqlite
* libapache2-mod-php5
* phpmyadmin
* yacomas

## Notes

If using `vagrant-libvirt` plugin as provider for the vm  the port forwarding tunnels may not be created
To create the tunnel for apache use the following command

```
vagrant ssh -- -f -N -L 8080:localhost:80
```
