# Configuration subfile for Bacula.
#

define bacula::subfile::device (
  $options    = {},
  $config_dir = undef,
) {
  $merged_options = { 'Device' => $options }

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/devices",
    default => $config_dir,
  }

  $owner = $bacula::sd::file_owner

  validate_absolute_path("${conf_dir_real}")

  file { "${conf_dir_real}/${name}":
    ensure  => $ensure,
    mode    => '0440',
    owner   => $owner,
    content => template('bacula/config.erb'),
    require => Class['bacula::sd::config'],
    notify  => Class['bacula::sd::service'],
  }

}
