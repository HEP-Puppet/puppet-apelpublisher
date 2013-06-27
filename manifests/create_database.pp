class apelpublisher::create_database (
  $mysql_database            = $apelpublisher::params::mysql_database,
  $mysql_user                = $apelpublisher::params::mysql_user,
  $mysql_root_password       = $apelpublisher::params::mysql_root_password,
  $mysql_apel_password       = $apelpublisher::params::mysql_apel_password,
  $list_of_apel_parser_hosts = $apelpublisher::params::list_of_apel_parser_hosts,
  $configure_backup          = $apelpublisher::params::mysql_configure_backup,
  $mysql_backup_folder       = $apelpublisher::params::mysql_backup_folder,) inherits apelpublisher::params {
  database_user { '${mysql_user}@localhost': password_hash => mysql_password($mysql_apel_password) }

  mysql::db { $mysql_database: user => $mysql_user, }

  $permission_defaults = {
    'mysql_user'     => $mysql_user,
    'mysql_database' => $mysql_database,
  }
  create_resources('apelpublisher::db_permissions', $list_of_apel_parser_hosts, $permission_defaults)

  exec { 'create-apel-mysql-tables':
    command => '/usr/bin/mysql -p apelclient < /usr/share/apel/client.sql',
    require => [
      File['/usr/share/apel/client.sql'],
      Class["mysql"],
      Class["mysql::server"],
      Database[$mysql_database]],
  }
}