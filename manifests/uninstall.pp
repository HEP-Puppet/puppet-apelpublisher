class apelpublisher::uninstall {
  package { [
    "apel-ssm",
    "apel-lib",
    "apel-client"]:
    ensure => "absent",
  }
}