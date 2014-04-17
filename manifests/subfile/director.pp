# Configuration subfile for Bacula.
#

define bacula::subfile::director (
  $options    = {},
  $config_dir = undef,
) {
  $merged_options = { 'Director' => $options }

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/directors",
    default => $config_dir,
  }

  validate_absolute_path("${conf_dir_real}")

  file { "${conf_dir_real}/${name}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb'),
    require => Class['bacula::sd::config'],
    notify  => Class['bacula::sd::service'],
  }

}
