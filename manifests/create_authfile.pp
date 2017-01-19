define xrootd::create_authfile (
  $entries,
) {
  require xrootd::config
  
  file {$title:
    content => template($xrootd::config::authfile_template)
  }

}
