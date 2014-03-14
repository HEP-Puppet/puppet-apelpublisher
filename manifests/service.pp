class apelpublisher::service (
  $runboot = false,
  $runcron = true,
) {
  if $::osfamily == 'RedHat' and $::operatingsystemversion =~ /^5\..*/ {
    $pkgname = 'fetch-crl3'
  } else {
    $pkgname = 'fetch-crl'
  }

  package { $pkgname :
    ensure => 'present',
   }

  service { "${pkgname}-boot":
    ensure     => $runboot,
    enable     => $runboot,
    hasstatus  => true,
    hasrestart => true,
  }

  service { "${pkgname}-cron":
    ensure     => $runcron,
    enable     => $runcron,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$pkgname];
  }
}
