class apelpublisher::ca_policy_egi_core {
  yumrepo { 'EGI-trustanchors':
    baseurl  => "http://repository.egi.eu/sw/production/cas/1/current/",
    gpgcheck => 1,
    gpgkey   => 'http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3',
    enabled  => 1,
    priority => 80,
  }

  package { "ca-policy-egi-core":
    ensure  => latest,
    require => Yumrepo['EGI-trustanchors'],
  }
}