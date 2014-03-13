# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::config (
  $ensure      = $bacula::config_ensure,
  $options     = $bacula::config_options,
  $config_dir  = $bacula::config_dir,
  $config_file = $bacula::config_file,
) {
  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/bacula.conf.erb')
  }
}

