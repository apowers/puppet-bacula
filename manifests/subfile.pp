# Configuration subfile for Bacula.
#

define bacula::subfile (
  $type       = undef,
  $options    = {},
  $config_dir = undef,
) {
  $merged_options = $options

  $conf_dir_real = $config_dir ? {
    undef   => $bacula::defaults::config_directory,
    default => $config_dir,
  }

  validate_absolute_path("${conf_dir_real}/${type}")

  file { "${conf_dir_real}/${type}/${name}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb')
  }

}
