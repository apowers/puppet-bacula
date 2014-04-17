# Configuration subfile for Bacula.
#

define bacula::subfile::pool (
  $options    = {},
  $config_dir = undef,
) {
  $merged_options = { 'Pool' => $options }

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/pools",
    default => $config_dir,
  }

  validate_absolute_path("${conf_dir_real}")

  file { "${conf_dir_real}/${name}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb'),
    require => Class['bacula::director::config'],
    notify  => Class['bacula::director::service'],
  }

}
