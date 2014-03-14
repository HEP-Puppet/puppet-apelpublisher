class apelpublisher::config::mysql(
  $mysql_root_password    = $apelpublisher::params::mysql_root_password,
  $mysql_configure_backup = $apelpublisher::params::mysql_configure_backup,
  $mysql_backup_folder    = $apelpublisher::params::mysql_backup_folder,
  $mysql_apel_password    = $apelpublisher::params::mysql_apel_password,
) inherits apelpublisher::params {

  if !$mysql_root_password {
    notify { 'Using empty ROOT password. Please fix.': }
  }

  ############################
  # MySQL server and settings
  ############################
  class { 'mysql::server':
    root_password    => $mysql_root_password,
    override_options => {
      mysqld => { 'bind_address' => '0.0.0.0' }
    }
  }

  if $mysql_configure_backup {
    class { 'mysql::backup':
      # it always tries to create the backup user,
      # using 'root' here causes a 'duplicate declaration' error
      backupuser     => 'mysqlbackup',
      backuppassword => $mysql_root_password,
      backupdir      => $mysql_backup_folder,
    }
  }

}
