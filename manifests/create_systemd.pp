define xrootd::create_systemd (
  $filename = $title,
  $xrootd_user = $xrootd::config::xrootd_user,
  $xrootd_group = $xrootd::config::xrootd_group,
  $exports = $xrootd::config::exports,
  $daemon_corefile_limit = $xrootd::config::daemon_corefile_limit,
  $runtime_dir = $xrootd::config::runtime_dir,
  $after_conf = $xrootd::config::after_conf
) {
  include xrootd::config

  file {"/etc/systemd/system/${filename}.service.d/":
    ensure => directory,
    owner   => root,
    group   => root,
  } ->
  file {"/etc/systemd/system/${filename}.service.d/override.conf":
    ensure  => file,
    owner   => root,
    group   => root,
    content => template('xrootd/override.erb'),
  }  

}
