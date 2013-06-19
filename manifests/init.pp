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
  class { 'apelpublisher::install': }

  class { 'apelpublisher::create_database': }

  class { 'apelpublisher::config': }

  class { 'apelpublisher::service': }
}
