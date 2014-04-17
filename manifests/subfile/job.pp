# Configuration subfile for Bacula.
#

define bacula::subfile::job (
  $config_dir = undef,
  $options    = {},
) {

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/jobs",
    default => $config_dir,
  }

  validate_absolute_path("${conf_dir_real}")

  file { "${conf_dir_real}/${name}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/job.erb'),
    require => Class['bacula::director::config'],
    notify  => Class['bacula::director::service'],
  }

}
