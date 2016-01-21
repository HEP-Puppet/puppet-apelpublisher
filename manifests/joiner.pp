/**
 * For those willing to run multiple apel publishers for multiple subsites, an instance is needed for each site
 * You must include the apelpublisher::params before cllaing this include if you want to make sure all default params are there.
 * 
 * The resource title can be the GOC DB site name
 * 
 * NOTE : you must make sure you included the apelpublisher::install class with your prefered options before using this defined resource.
 * 
 */
define apelpublisher::joiner(
  $mysql_hostname          = $apelpublisher::params::mysql_hostname,
  $mysql_port              = $apelpublisher::params::mysql_port,
  $mysql_database          = $apelpublisher::params::mysql_database,
  $mysql_user              = $apelpublisher::params::mysql_user,
  $mysql_password          = $apelpublisher::params::mysql_apel_password,
  $site_name               = $title, #this is the GOC DB name
  $ldap_host               = $apelpublisher::params::ldap_host, #this is the BDII where SPEC information will be looked up
  $ldap_port               = $apelpublisher::params::ldap_port,
  $joiner_local_jobs       = $apelpublisher::params::joiner_local_jobs, 
  $unloader_enabled        = $apelpublisher::params::unloader_enabled,
  $unloader_dir_location   = $apelpublisher::params::unloader_dir_location,
  $unloader_send_summaries = $apelpublisher::params::unloader_send_summaries,
  $unloader_withhold_dns   = $apelpublisher::params::unloader_withhold_dns,
  $ssm_enabled             = false,
  $joiner_enabled          = true,
  $logging_logfile         = $apelpublisher::params::logging_logfile,
  $logging_level           = $apelpublisher::params::logging_level,
  $logging_console         = $apelpublisher::params::logging_console,
  $cron_minutes = $apelpublisher::params::cron_minutes,
  $cron_hours   = $apelpublisher::params::cron_hours,
  
  )  {
    
  $config="/etc/apel/client-${title}.cfg"
  file { $config :
    owner   => "root",
    group   => "root",
    ensure  => "present",
    content => template("${module_name}/client.cfg.erb"),
    require => Package['apel-client'],
    mode => '0600',
  }
  
  cron { "apelclient-${title}":
    command => "/usr/bin/apelclient -c $config >> /var/log/apel-joiner-${title}.log 2>&1",
    user    => root,
    hour    => $cron_hours,
    minute  => $cron_minutes,
  }
  
}
