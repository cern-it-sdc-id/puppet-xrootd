class xrootd::params {
  $xrootd_user = "xrootd"
  $xrootd_group = "xrootd"
  $configdir = "/etc/xrootd"
  $logdir = "/var/log/xrootd"
  $spooldir = "/var/spool/xrootd"
  
  $sysconfigfile = "/etc/sysconfig/xrootd"
  $sysconfigfile_template = "xrootd/sysconfig.erb"
  $configfile = "${configdir}/xrootd.cfg"
  $configfile_template = "xrootd/xrootd.cfg.erb"
  $authfile = "${configdir}/auth_file"
  $authfile_template = "xrootd/authfile_generic.erb"
  $digauthfile = "${configdir}/digauth.cfg"
  $digauthfile_template = "xrootd/digauthfile.erb"
  $all_adminpath = "/var/spool/xrootd"
  $all_pidpath = "/var/run/xrootd"
  
  # Unlike the other *_instances_options, this is an array of hashes.
  $xrootd_instances_options = [ {"default" => "-l ${logdir}/xrootd.log -c ${configdir}/xrootd-clustered.cfg -k fifo"} ]
  $cmsd_instances_options = undef # { "default" => "-l /var/log/xrootd/cmsd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo" }
  $purd_instances_options = undef # { "default" => "-l /var/log/xrootd/purd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo" }
  $xfrd_instances_options = undef # { "default" => "-l /var/log/xrootd/xfrd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo" }
  
  $exports = undef
  
  $daemon_corefile_limit = "unlimited"
  
  $grid_security = '/etc/grid-security'
  $certificate = "${grid_security}/hostcert.pem"
  $key = "${grid_security}/hostkey.pem"
}
