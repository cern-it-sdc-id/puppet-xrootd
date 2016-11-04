define xrootd::create_digauthfile (
  $host,
  $group,
) {
  require xrootd::config

  file {$title:
    content => template($xrootd::config::digauthfile_template)
  }

}
