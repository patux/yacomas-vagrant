# Puppet configurations

class phpmyadmin
{
    package
    {
        "phpmyadmin":
            ensure => present,
            require => [
                Exec['apt-get update', 'phpmyadmin preinstall'],
            ]
    }

    file
    {
        "/tmp/setselections.sh":
            owner => vagrant,
            group => vagrant,
            mode => '0755',
            source => 'puppet:///modules/phpmyadmin/setselections.sh',
            require => Package["php5", "php5-mysql", "apache2", "mysql-server"]
    }
    exec
    {
        "phpmyadmin preinstall":

        require => File["/tmp/setselections.sh"],
        command => "/tmp/setselections.sh",
        logoutput => true,
    }

    file
    {
        "/etc/apache2/conf-enabled/phpmyadmin.conf":
            ensure => link,
            target => "/etc/phpmyadmin/apache.conf",
            require => Package['apache2','phpmyadmin'],
            notify => Service["apache2"]
    }

}
