define xrootd::create_systemd (
  $xrootd_user = $xrootd::config::xrootd_user,
  $xrootd_group = $xrootd::config::xrootd_group,
  $exports = $xrootd::params::exports,
  $daemon_corefile_limit = $xrootd::params::daemon_corefile_limit,
  $enable_hdfs = false,
  $java_home = undef,
) {
  require xrootd::service

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
