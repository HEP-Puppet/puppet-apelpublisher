class apelpublisher::config_mysql(
  $mysql_root_password    = $apelpublisher::params::mysql_root_password,
  $mysql_configure_backup = $apelpublisher::params::mysql_configure_backup,
  $mysql_backup_folder    = $apelpublisher::params::mysql_backup_folder,
  $mysql_apel_password    = $apelpublisher::params::mysql_apel_password,
) inherits apelpublisher::params {
  
  if !$mysql_root_password {
    notify { "Using empty ROOT password. Please fix.": }
  }
  
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

  if $mysql_configure_backup {
    class { 'mysql::backup':
      backupuser     => 'root',
      backuppassword => $mysql_root_password,
      backupdir      => $mysql_backup_folder,
    }
  }
  
}
