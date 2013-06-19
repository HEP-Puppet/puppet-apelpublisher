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