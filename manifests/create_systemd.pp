define xrootd::create_systemd (
  $exports = $xrootd::params::exports,
  $daemon_corefile_limit = $xrootd::params::daemon_corefile_limit,
) {
  require xrootd::config

  file {"/etc/systemd/system/${title}.service.d/":
    ensure => directory,
    owner   => root,
    group   => root,
  } ->
  file {"/etc/systemd/system/${title}.service.d/override.conf":
    ensure  => file,
    owner   => root,
    group   => root,
    content => template('xrootd/override.erb'),
  }  ~> Exec['systemctl-daemon-reload']

}
