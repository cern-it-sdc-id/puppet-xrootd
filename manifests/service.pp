class xrootd::service (
  $xrootd_instances,
  $cmsd_instances,
  $certificate = $xrootd::params::certificate,
  $key	= $xrootd::params::key,
) inherits xrootd::params {

  Service {
    ensure    => running,
    enable    => true,
    subscribe => File[$certificate,$key],
  }

  if $::osfamily == 'RedHat' and ($::operatingsystemmajrelease + 0) >= 7 { 
    if $xrootd_instances == undef {
      fail("xrootd_instances parameter should not be empty")
    }
    else {
      service {$xrootd_instances:
        provider  => systemd,
      }
    }
    
    if $cmsd_instances != undef {
      service {$cmsd_instances:
        provider  => systemd,
        require   => Service[$xrootd_instances],
      }
    }
  }
  
  else {
    # Start the services
    service {'xrootd': }
    
    service {'cmsd':
      require   => Service['xrootd'],
    }
  }
}
