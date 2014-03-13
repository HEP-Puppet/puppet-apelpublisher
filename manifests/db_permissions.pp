define apelpublisher::db_permissions (
  $host           = $title,
  $mysql_user     = $apelpublisher::params::mysql_user,
  $mysql_database = $apelpublisher::params::mysql_database,) {
  mysql_grant { "'${mysql_user}@${host}'/${mysql_database}":
    privileges => ['all'],
    table      => "${mysql_database}.*",
    user       => "${mysql_user}@${host}"
  }
}
