# Puppet configurations
 
class base {
## Update apt-get ##
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
  }
}

class http {
 
  define apache::loadmodule () {
    exec { "/usr/sbin/a2enmod $name" :
      unless => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
      notify => Service['apache2']
    }
  }
 
  apache::loadmodule{"rewrite":
    require => Package['apache2']
    }
 
  package { "apache2":
    ensure  => present,
    require => Exec['apt-get update'],
  }
 
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }
}

class php{
 
  package { [ "php5",
              "php5-cli",
              "php5-xdebug",
              "php5-mysql",
              "php5-imagick",
              "php5-mcrypt",
              "php-pear",
              "php5-dev",
              "php5-curl",
              "php5-sqlite",
              "libapache2-mod-php5" ]:
    ensure => present,
    require => Exec['apt-get update'],
  }
  file { '/var/www/index.php':
    mode   => 644,
    owner  => root,
    group  => root,
    content => '<h1>Menu index of vagrant \o/</h1>
                <p><?php phpinfo(); ?></p>',

    require => Class['http'],
  }
}

class mysql{
 
  package { "mysql-server":
    ensure => present,
    require => Exec['apt-get update'],
  }
 
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { 'set mysqlpassword':
    command =>'/usr/bin/mysqladmin -u root password root || echo',
    require => Package ['mysql-server'],
  }

}

class phpmyadmin
{
    package
    {
        "phpmyadmin":
            ensure => present,
            require => [
                Exec['apt-get update'],
                Package["php5", "php5-mysql", "apache2"],
            ]
    }

    file
    {
        "/etc/apache2/conf.d/phpmyadmin.conf":
            ensure => link,
            target => "/etc/phpmyadmin/apache.conf",
            require => Package['apache2'],
            notify => Service["apache2"]
    }

}

class yacomas
{
  package { 'git':
    ensure => present,
    require => Exec['apt-get update'],
  }
  vcsrepo { "/vagrant/yacomas":
    ensure   => present,
    provider => git,
    owner    => www-data,
    group    => www-data,
    source   => 'https://github.com/patux/YaCOMAS.git',
    revision => 'master',
    require => [ Package['git'], Class['phpmyadmin'],]
  }
  exec { "create yacomas_db":
    command => '/usr/bin/mysql -u root --password=root < /vagrant/yacomas/Yacomas_reference/database/create_db.sql',
    require => [ Vcsrepo['/vagrant/yacomas'], Package['phpmyadmin'], Exec['set mysqlpassword'] ],
  }
  file { "/var/www/yacomas":
    ensure => link,
    target => '/vagrant/yacomas',
    require => Vcsrepo['/vagrant/yacomas'],
  }
}

include base
include http
include php
include mysql
include phpmyadmin
include yacomas
