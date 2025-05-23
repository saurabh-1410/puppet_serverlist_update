# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_serverlist_update
class puppet_serverlist_update {

  exec { 'append':
    command => '/bin/echo "some_list = puppet.example.com" >> /etc/puppetlabs/puppet/puppet.conf',
    path    => ['/bin', '/usr/bin'],
    notify  => Service['puppet'],
  }

  service { 'puppet':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
