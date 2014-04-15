# Configuration subfile for Bacula.
#

define bacula::fileset (
  $config_dir       = undef,
  $options          = {},
  $include_options  = {'signature' => 'MD5'},
  $include_files    = [],
  $exclude_files    = [],
) {

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/filesets",
    default => $config_dir,
  }

  validate_hash($options)
  validate_hash($include_options)
  validate_array($include_files)
  validate_array($exclude_files)
  validate_absolute_path("${conf_dir_real}/${type}")

  file { "${conf_dir_real}/${name}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/fileset.erb')
  }

}
