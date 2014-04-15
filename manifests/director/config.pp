# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::director::config (
  $ensure           = $bacula::director::config_ensure,
  $options          = $bacula::director::config_options,
  $config_dir       = $bacula::director::config_dir,
  $config_file      = $bacula::director::config_file,
  $bconsole_options = $bacula::director::bconsole_options,
) {

  $include_directories = [
    "${config_dir}/catalogs",
    "${config_dir}/clients",
    "${config_dir}/consoles",
    "${config_dir}/filesets",
    "${config_dir}/jobdefs",
    "${config_dir}/jobs",
    "${config_dir}/messages",
    "${config_dir}/pools",
    "${config_dir}/schedules",
    "${config_dir}/storage",
  ]

  file { $include_directories:
    ensure  => 'directory',
    mode    => '0440',
  }

  $merged_director_options = merge($bacula::defaults::default_director_options, $options)
  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/bacula-dir.conf.erb')
  }

  $merged_options = merge($bacula::defaults::default_bconsole_options, $bconsole_options)
  file { "${config_dir}/bconsole.conf":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb')
  }

}

