define apelpublisher::db_permissions($host = $title, $mysql_apel_password) {
  mysql::db { 'apelclient':
    user     => 'apel',
    password => $mysql_apel_password,
    host     => $host,
    grant    => ['all'],
  }
}