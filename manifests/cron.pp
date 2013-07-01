class apelpublisher::cron (
  $cron_minutes = $apelpublisher::params::cron_minutes,
  $cron_hours   = $apelpublisher::params::cron_hours,) inherits apelpublisher::params {
  cron { apelclient:
    command => "/usr/bin/apelclient",
    user    => root,
    hour    => $cron_hours,
    minute  => $cron_minutes,
  }
}