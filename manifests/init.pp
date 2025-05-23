# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_serverlist_update
class puppet_serverlist_append {

  exec { 'append_server_list_to_puppet_conf':
    command => '/bin/echo "server_list = puppet.example.com" >> /etc/puppetlabs/puppet/puppet.conf',
    path    => ['/bin', '/usr/bin'],
    unless  => '/bin/false',  # Always run
    notify  => Service['puppet'],
  }

  service { 'puppet':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
