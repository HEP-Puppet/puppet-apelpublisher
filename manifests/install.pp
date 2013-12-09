class apelpublisher::install (
  $with_repos = true, #use shipped repos ?
  $with_cas = true, #install certificate authorities ?
  ) {
  
  if($with_cas) {
    # ca-policy-egi-core
    class { "apelpublisher::ca_policy_egi_core":
    }
  }
  
  $repos_req = $with_repos ? {
    true => [
      Yumrepo['epel'],
      Yumrepo['EMI_3_base']],
    default => []
  }

  package { [
    "apel-ssm",
    "apel-client"]:
    ensure  => present,
    require => $repos_req,
  }

}
