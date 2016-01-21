class apelpublisher::config (
  $mysql_hostname          = $apelpublisher::params::mysql_hostname,
  $mysql_port              = $apelpublisher::params::mysql_port,
  $mysql_database          = $apelpublisher::params::mysql_database,
  $mysql_user              = $apelpublisher::params::mysql_user,
  $mysql_password          = $apelpublisher::params::mysql_apel_password,
  $site_name               = $apelpublisher::params::site_name,
  $ldap_host               = $apelpublisher::params::ldap_host,
  $ldap_port               = $apelpublisher::params::ldap_port,
  $joiner_local_jobs       = $apelpublisher::params::joiner_local_jobs,
  $joiner_enabled          = $apelpublisher::params::joiner_enabled,
  $unloader_enabled        = $apelpublisher::params::unloader_enabled,
  $unloader_dir_location   = $apelpublisher::params::unloader_dir_location,
  $unloader_send_summaries = $apelpublisher::params::unloader_send_summaries,
  $unloader_withhold_dns   = $apelpublisher::params::unloader_withhold_dns,
  $ssm_enabled             = $apelpublisher::params::ssm_enabled,
  $logging_logfile         = $apelpublisher::params::logging_logfile,
  $logging_level           = $apelpublisher::params::logging_level,
  $logging_console         = $apelpublisher::params::logging_console,
  ) inherits apelpublisher::params {
    
  file { '/etc/apel/client.cfg':
    owner   => "root",
    group   => "root",
    ensure  => "present",
    content => template("${module_name}/client.cfg.erb"),
    require => [Package['apel-client'],Package['apel-ssm']],
    mode => '0600',
  }
  
  include apelpublisher::ssm::sender
}
