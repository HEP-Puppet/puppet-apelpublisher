define apelpublisher::db_permissions($host = $title) {
  
  database_grant {"apel@${host}/apelclient":
    privileges => ['all'],
  }
  
#  mysql::db { 'apelclient':
#    user     => 'apel',
#    password => $mysql_apel_password,
#    host     => $host,
#    grant    => ['all'],
#  }
}