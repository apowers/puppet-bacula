# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::fd::config (
  $ensure      = $bacula::fd::config_ensure,
  $options     = $bacula::fd::config_options,
  $config_dir  = $bacula::fd::config_dir,
  $config_file = $bacula::fd::config_file,
) {
  $merged_options = merge($bacula::defaults::default_fd_options, $options)
  $assignment_character = ' = '

  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb')
  }

}

