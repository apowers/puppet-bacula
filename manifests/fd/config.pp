# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::fd::config (
  $director         = $bacula::fd::director,
  $password         = $bacula::fd::password,
  $ensure           = $bacula::fd::config_ensure,
  $fd_options       = $bacula::fd::config_options,
  $config_dir       = $bacula::fd::config_dir,
  $config_file      = $bacula::fd::config_file,
  $dir_options      = {},
  $message_options  = {},
) {

  include bacula::defaults

  # Here instead of in defaults because "${director}"
  $default_dir_options = {
    'Name'      => "${director}-dir",
    'Password'  => $password,
  }

  # Here instead of in defaults because "${director}"
  $default_fd_message_options = {
    'Name'      => 'Standard',
    'Append'    => '"/var/log/bacula/bacula-fd.log" = all, !skipped',
    'Director'  => "${director}-dir = all, !skipped, !restored",
  }

  $merged_options = merge($bacula::defaults::default_fd_options, $fd_options)
  $merged_dir_options = merge($default_dir_options, $dir_options)
  $merged_message_options = merge($default_fd_message_options, $message_options)

  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/bacula-fd.conf.erb')
  }

}

