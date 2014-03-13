# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::config (
  $ensure      = $bacula::server::config_ensure,
  $options     = $bacula::server::config_options,
  $config_dir  = $bacula::server::config_dir,
  $config_file = $bacula::server::config_file,
) {
  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/bacula.conf.erb')
  }
}

