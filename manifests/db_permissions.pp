define apelpublisher::db_permissions (
  $host           = $title,
  $mysql_user     = $apelpublisher::params::mysql_user,
  $mysql_database = $apelpublisher::params::mysql_database,) {
  database_grant { "'${mysql_user}'@'${host}'/${mysql_database}": privileges => [
      'all'], }
}