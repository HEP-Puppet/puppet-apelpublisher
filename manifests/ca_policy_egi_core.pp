class apelpublisher::ca_policy_egi_core {
  package { "ca-policy-egi-core":
    ensure  => latest,
    require => Yumrepo['EGI-trustanchors'],
  }
}