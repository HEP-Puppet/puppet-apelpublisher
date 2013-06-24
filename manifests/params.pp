class apelpublisher::params {
  $apel_ssm_rpm              = 'http://apel.github.io/apel/rpms/SL6/apel-ssm-2.1.0-0.el6.noarch.rpm'
  $apel_lib_rpm              = 'http://apel.github.io/apel/rpms/SL6/apel-lib-1.1.2-0.el6.noarch.rpm'
  $apel_client_rpm           = 'http://apel.github.io/apel/rpms/SL6/apel-client-1.1.2-0.el6.noarch.rpm'
  $mysql_root_password       = "changeme"
  $mysql_apel_password       = "pleasechangeme"
  $list_of_apel_parser_hosts = []

  $mysql_configure_backup    = true
  $mysql_backup_folder       = "/tmp/mysql_backup"

  $mysql_hostname            = "localhost"
  $mysql_port                = 3306
  $mysql_database            = "apelclient"
  $mysql_user                = "apel"

  $site_name                 = "T4_LFT_Changeme"
  $ldap_host                 = "lcg-bdii.cern.ch"
  $ldap_port                 = 2170

  $joiner_local_jobs         = false
  $joiner_enabled            = true

  $unloader_enabled          = true
  $unloader_dir_location     = "/var/spool/apel/"
  $unloader_send_summaries   = false
  $unloader_withhold_dns     = false

  $ssm_enabled               = true

  $logging_logfile           = "/var/log/apel/client.log"
  $logging_level             = "INFO"
  $logging_console           = true

}