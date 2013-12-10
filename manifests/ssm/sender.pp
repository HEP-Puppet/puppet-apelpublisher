/**
 * This sets up the SSM sender
 * 
 * The erb curently is not using any option
 */
 class apelpublisher::ssm::sender(
   $destination_queue         = $apelpublisher::params::destination_queue,
   $msg_network               = $apelpublisher::params::msg_network,
 ) inherits apelpublisher::params {
   
   file { '/etc/apel/sender.cfg':
    owner   => "root",
    group   => "root",
    ensure  => "present",
    content => template("${module_name}/sender.cfg.erb"),
    require => Package['apel-ssm'],
  }
 }
