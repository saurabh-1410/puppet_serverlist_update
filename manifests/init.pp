# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_serverlist_update
class puppet_serverlist_update (
  String $server_list_value = 'puppet.example.com',
) {

  file { '/etc/puppetlabs/puppet/puppet.conf':
    ensure  => file,
    content => template('puppet_serverlist_update/puppet.conf.erb'),
    notify  => Service['puppet'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  service { 'puppet':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
