class apelpublisher::repositories inherits apelpublisher::params {

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

  yumrepo { 'EMI_3_base':
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/base",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { 'EMI_3_contribs':
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/contribs",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { 'EMI_3_third-party':
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/third-party",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { 'EMI_3_updates':
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/updates",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

}
