# Class: puppet-apelpublisher
#
# This module manages puppet-apelpublisher
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class apelpublisher () inherits apelpublisher::params {
  class { 'apelpublisher::repositories': }

  class { 'apelpublisher::install': }

  class { 'apelpublisher::create_database': }

  class { 'apelpublisher::config': }

  class { 'apelpublisher::cron': }

  Class['apelpublisher::repositories'] -> Class['apelpublisher::install'] -> Class['apelpublisher::create_database'] -> 
  Class['apelpublisher::config'] -> Class['apelpublisher::cron']
}
