class apelpublisher::params {
  $mysql_root_password       = "changeme"
  $mysql_apel_password       = "pleasechangeme"
  $list_of_apel_parser_hosts = undef

  $mysql_configure_backup    = true
  $mysql_backup_folder       = "/tmp/mysql_backup"

  $mysql_hostname            = "localhost"
  $mysql_port                = 3306
  $mysql_database            = "apelclient"
  $mysql_user                = "apel"

  $site_name                 = "UKI-SOUTHGRID-XXX-HEP"
  $ldap_host                 = "lcg-bdii.cern.ch"
  $ldap_port                 = 2170

  $joiner_local_jobs         = false
  $joiner_enabled            = true

  $unloader_enabled          = true
  $unloader_dir_location     = "/var/spool/apel/"
  $unloader_send_summaries   = false
  $unloader_withhold_dns     = false

  $ssm_enabled               = true
  $destination_queue         = '/queue/global.accounting.cputest.CENTRAL' #originally not configured by default. Change cputest to cpu when ready. Warning case sensitive !
  $msg_network               = 'TEST-NWOB' #change to PROD when ready
  $use_ssl                   = true #beware : the test brokers do not support SSL, but it is better to leave this on by default, for production

  $logging_logfile           = "/var/log/apel/client.log"
  $logging_level             = "INFO"
  $logging_console           = true

  # cron
  $cron_minutes              = 35
  $cron_hours                = 1

}
