class apelpublisher::install (
  $mysql_root_password       = $apelpublisher::params::mysql_root_password,
  $mysql_backup_folder       = $apelpublisher::params::mysql_backup_folder,
  $mysql_apel_password       = $apelpublisher::params::mysql_apel_password,
  $list_of_apel_parser_hosts = $apelpublisher::params::list_of_apel_parser_hosts) {
  # ca-policy-egi-core
  class { "apelpublisher::ca_policy_egi_core": }

  # apel-ssm
  # apel-lib
  # apel-client
  package { 'apel-ssm':
    ensure  => present,
    source  => "http://apel.github.io/apel/rpms/SL6/apel-ssm-2.1.0-0.el6.noarch.rpm",
    require => Yumrepo['epel'],
  }

  package { 'apel-lib':
    ensure  => present,
    source  => "http://apel.github.io/apel/rpms/SL6/apel-lib-1.1.2-0.el6.noarch.rpm",
    require => Yumrepo['epel'],
  }

  package { 'apel-client':
    ensure  => present,
    source  => "http://apel.github.io/apel/rpms/SL6/apel-client-1.1.2-0.el6.noarch.rpm",
    require => Yumrepo['epel'],
  }

  file { '/usr/share/apel/client.sql':
    owner  => "root",
    group  => "root",
    ensure => "present",
    source => "puppet:///modules/${module_name}/client.sql",
  }

  Package['apel-ssm'] -> Package['apel-lib'] -> Package['apel-client'] -> File['/usr/share/apel/client.sql']

  ############################
  # MySQL server and settings
  ############################
  class { 'mysql::server':
    config_hash => {
      'root_password' => $mysql_root_password,
    }
  }

  class { 'mysql':
    root_password => $mysql_root_password,
  }

}