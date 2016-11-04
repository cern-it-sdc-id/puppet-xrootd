class xrootd::config (
  $xrootd_user = $xrootd::params::xrootd_user,
  $xrootd_group = $xrootd::params::xrootd_group,
  $configdir = $xrootd::params::configdir,
  $logdir = $xrootd::params::logdir,
  $spooldir = $xrootd::params::spooldir,
  $all_pidpath = $xrootd::params::all_pidpath,
  $grid_security = $xrootd::params::grid_security,
) inherits xrootd::params {
  
  # Rely on this class to be known to Puppet in some way.
  include fetchcrl
  
  exec {'run-fetchcrl-atleastonce':
    path    => "/bin:/usr/bin:/sbin:/usr/sbin",
    command => "fetch-crl",
    unless  => "ls ${grid_security}/certificates/*.r0"
  }
  
  exec {'systemctl-daemon-reload':
    command     => '/usr/bin/systemctl daemon-reload',
    refreshonly => true,
  }
  
  File {
    owner  => $xrootd_user,
    group  => $xrootd_group,
  }

  file { [$configdir, $logdir, $spooldir, $all_pidpath]:
    ensure => directory,
  }
  
}
