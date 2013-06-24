class apelpublisher::repositories {
  yumrepo { 'epel':
    descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
    enabled        => 1,
    failovermethod => 'priority',
    gpgcheck       => 1,
    gpgkey         => 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6',
    mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
  }

  yumrepo { 'EGI-trustanchors':
    baseurl  => "http://repository.egi.eu/sw/production/cas/1/current/",
    gpgcheck => 1,
    gpgkey   => 'http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3',
    enabled  => 1,
    priority => 80,
  }
}