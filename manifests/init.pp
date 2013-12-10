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
class apelpublisher {
  class { 'apelpublisher::repositories': }
  ->
  class { 'apelpublisher::install': }
  ->
  class { 'apelpublisher::config::mysql': }
  ->
  class { 'apelpublisher::create_database': }
  ->
  class { 'apelpublisher::config': }
  ->
  class { 'apelpublisher::cron': }
  ->
  class { 'apelpublisher::service': }
}
