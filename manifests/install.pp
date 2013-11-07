class apelpublisher::install  (
  $mysql_root_password    = $apelpublisher::params::mysql_root_password,
  $mysql_configure_backup = $apelpublisher::params::mysql_configure_backup,
  $mysql_backup_folder    = $apelpublisher::params::mysql_backup_folder,
  $mysql_apel_password    = $apelpublisher::params::mysql_apel_password,) inherits apelpublisher::params {
  if !$mysql_root_password {
    notify { "Using empty ROOT password. Please fix.": }
  }

  # ca-policy-egi-core
  if $install_ca {
  include apelpublisher::ca_policy_egi_core
  }
 
  package { [
    "apel-ssm",
    "apel-lib",
    "apel-client"]:
    ensure  => present,
 # It is not require because ordering is setup in init.pp   
 #   require => [
 #     Yumrepo['epel'],
 #     Yumrepo['EMI_3_base']],
  }

  Package["apel-ssm"] -> Package["apel-lib"] -> Package["apel-client"]

  ############################
  # MySQL server and settings
  ############################
  

  class { '::mysql::server':
    root_password => "$mysql_root_password",
    override_options => { 'mysqld' => { 'bind_address' => '0.0.0.0'} }
  }

#  class { 'mysql':
#  }

  if $mysql_configure_backup {
    class { '::mysql::server::backup':
      backupuser     => 'root',
      backuppassword => "$mysql_root_password",
      backupdir      => "$mysql_backup_folder",
    }
  }
}
