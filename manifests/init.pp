# == Class: xrootd
#
# Refer to the README for detailed documentation.
#
# === Authors
#
# CERN DPM <dpm-devel@cern.ch>
#
# === Copyright
#
# Copyright 2012 CERN, unless otherwise noted.
#
class xrootd (
  $xrootd_instances = undef,
  $cmsd_instances = undef,
) {
  
  class{"xrootd::install": } ->
    class{"xrootd::config": } ->
      class{"xrootd::service":
        xrootd_instances => $xrootd_instances,
        cmsd_instances => $cmsd_instances,
      }

}
