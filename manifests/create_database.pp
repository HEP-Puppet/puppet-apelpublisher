class apelpublisher::create_database (
  $mysql_database            = $apelpublisher::params::mysql_database,
  $mysql_user                = $apelpublisher::params::mysql_user,
  $mysql_root_password       = $apelpublisher::params::mysql_root_password,
  $mysql_apel_password       = $apelpublisher::params::mysql_apel_password,
  $list_of_apel_parser_hosts = $apelpublisher::params::list_of_apel_parser_hosts,
) inherits apelpublisher::params {

  mysql::db { $mysql_database:
    user     => $mysql_user,
    password => $mysql_apel_password
  }

  $permission_defaults = {
    'mysql_user'     => $mysql_user,
    'mysql_database' => $mysql_database,
  }

  if $list_of_apel_parser_hosts {
    create_resources('apelpublisher::db_permissions', $list_of_apel_parser_hosts, $permission_defaults)
  }

  exec { 'create-apel-mysql-tables':
    command => "/usr/bin/mysql --defaults-file=/root/.my.cnf ${mysql_database} < /usr/share/apel/client.sql",
    require => [
      Class["apelpublisher::install"],
      Mysql_database[$mysql_database]
    ],
    # needs check if already exists, otherwise will wipe the tables!
    onlyif  => [
      # only run if the database exists and does not contain any tables (found rows == 0), don't run in all other cases
      "/usr/bin/mysql --defaults-file=/root/.my.cnf -BNe 'show tables; SELECT FOUND_ROWS();' ${mysql_database} | /bin/grep '^0$'",
      '/usr/bin/test -f /usr/share/apel/client.sql'
    ],
    logoutput => 'on_failure',
  }
}
