# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::sd::config (
  $ensure      = $bacula::sd::config_ensure,
  $options     = $bacula::sd::config_options,
  $config_dir  = $bacula::sd::config_dir,
  $config_file = $bacula::sd::config_file,
  $owner       = $bacula::sd::file_owner,
) {
  $merged_options = merge($bacula::defaults::default_sd_options, $options)

  $include_directories = [
    "${config_dir}/autochangers",
    "${config_dir}/devices",
    "${config_dir}/directors",
  ]

  file { $include_directories:
    ensure  => 'directory',
    mode    => '0440',
    owner   => $owner,
  }

  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    owner   => $owner,
    content => template('bacula/bacula-sd.conf.erb')
  }

}

