define xrootd::create_digauthfile (
  $template = $xrootd::config::digauthfile_template,
  $host,
  $group,
) {
  require xrootd::config

  file {$title:
    content => template($template)
  }

}
