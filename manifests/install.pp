class apelpublisher::install (
  $mysql_root_password       = $apelpublisher::params::mysql_root_password,
  $mysql_backup_folder       = $apelpublisher::params::mysql_backup_folder,
  $mysql_apel_password       = $apelpublisher::params::mysql_apel_password,
  $list_of_apel_parser_hosts = $apelpublisher::params::list_of_apel_parser_hosts) {
  if !$mysql_root_password {
    notify { "Using empty ROOT password. Please fix.": }
  }

  # ca-policy-egi-core
  class { "apelpublisher::ca_policy_egi_core":
  }


  package { "apel-ssm":
    ensure   => present,
    provider => rpm,
    alias    => apel_ssm,
    require  => [Yumrepo['epel'], Yumrepo['EMI 3 base']],
  }

  package { "apel-lib":
    ensure   => present,
    provider => rpm,
    alias    => apel_lib,
    require  => [Yumrepo['epel'], Yumrepo['EMI 3 base']],
  }

  package { "apel-client":
    ensure   => present,
    provider => rpm,
    alias    => apel_client,
    require  => [Yumrepo['epel'], Yumrepo['EMI 3 base']],
  }

  file { '/usr/share/apel/client.sql':
    owner  => "root",
    group  => "root",
    ensure => "present",
    source => "puppet:///modules/${module_name}/client.sql",
  }

  Package["apel-ssm"] -> Package["apel-lib"] -> Package["apel-client"] -> File['/usr/share/apel/client.sql']

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