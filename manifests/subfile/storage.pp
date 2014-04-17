# Configuration subfile for Bacula.
#

define bacula::subfile::storage (
  $options    = {},
  $config_dir = undef,
) {
  $merged_options = { 'Storage' => $options }

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/storage",
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
