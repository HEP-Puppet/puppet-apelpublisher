class apelpublisher::install (
  $mysql_root_password       = $apelpublisher::params::mysql_root_password,
  $mysql_backup_folder       = $apelpublisher::params::mysql_backup_folder,
  $mysql_apel_password       = $apelpublisher::params::mysql_apel_password,
  $list_of_apel_parser_hosts = $apelpublisher::params::list_of_apel_parser_hosts) {
  # ca-policy-egi-core
  class { "apelpublisher::ca_policy_egi_core": }

  # apel-ssm
  $apel_ssm    = 'http://apel.github.io/apel/rpms/SL6/apel-ssm-2.1.0-0.el6.noarch.rpm'
  # apel-lib
  $apel_lib    = 'http://apel.github.io/apel/rpms/SL6/apel-lib-1.1.2-0.el6.noarch.rpm'
  # apel-client
  $apel_client = 'http://apel.github.io/apel/rpms/SL6/apel-client-1.1.2-0.el6.noarch.rpm'

  package { "apel-ssm":
    ensure   => present,
    source   => $apel_ssm,
    provider => rpm,
    alias    => apel_ssm,
    require  => Yumrepo['epel'],
  }

  package { "apel-lib":
    ensure   => present,
    source   => $apel_lib,
    provider => rpm,
    alias    => apel_lib,
    require  => Yumrepo['epel'],
  }

  package { "apel-client":
    ensure   => present,
    source   => $apel_client,
    provider => rpm,
    alias    => apel_client,
    require  => Yumrepo['epel'],
  }

  file { '/usr/share/apel/client.sql':
    owner  => "root",
    group  => "root",
    ensure => "present",
    source => "puppet:///modules/${module_name}/client.sql",
  }

  Package[apel_ssm] -> Package[apel_lib] -> Package[apel_client] -> File['/usr/share/apel/client.sql']

  ############################
  # MySQL server and settings
  ############################
  class { 'mysql::server':
    config_hash => {
      'root_password' => $mysql_root_password,
    }
  }

  class { 'mysql':
  }

}