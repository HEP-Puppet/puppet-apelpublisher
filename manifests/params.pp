class apelpublisher::params {
  $mysql_root_password       = hiera ('apelpublisher::params::mysql_root_password', undef)
  $mysql_apel_password       = hiera ('apelpublisher::params::mysql_apel_password', undef)
  $list_of_apel_parser_hosts = hiera ('apelpublisher::params::list_of_apel_parser_hosts', {})

  $mysql_configure_backup    = false
  $mysql_backup_folder       = "/var/mysql_backup"

  $mysql_hostname            = "localhost"
  $mysql_port                = 3306
  $mysql_database            = "apelclient"
  $mysql_user                = "apel"

  $site_name                 = hiera ('apelpublisher::params::site_name', undef)
  $ldap_host                 = hiera ('apelpublisher::params::ldap_host', undef)
  $ldap_port                 = 2170

  $joiner_local_jobs         = false
  $joiner_enabled            = true
  $destination_queue         = hiera ('apelpublisher::params::destination_queue', '/queue/global.accounting.cpu.central')
  $unloader_enabled          = true
  $unloader_dir_location     = "/var/spool/apel/"
  $unloader_send_summaries   = false
  $unloader_withhold_dns     = false

  $ssm_enabled               = true

  $logging_logfile           = "/var/log/apel/client.log"
  $logging_level             = "INFO"
  $logging_console           = true

  $setup_repo                = false
  $install_ca                = false
  $manage_db		     = false	
  # cron
  $cron_minutes              = 35
  $cron_hours                = 1

}
