# == Class: bacula
#
# Includes the Catalog resource.
#
# Full description of class bacula is in the README.
#
class bacula::director::config (
  $catalog_name     = $bacula::director::catalog_name,
  $db_name          = $bacula::director::db_name,
  $db_address       = $bacula::director::db_address,
  $db_port          = $bacula::director::db_port,
  $db_socket        = $bacula::director::db_socket,
  $db_user          = $bacula::director::db_user,
  $db_password      = $bacula::director::db_password,
  $ensure           = $bacula::director::config_ensure,
  $options          = $bacula::director::config_options,
  $config_dir       = $bacula::director::config_dir,
  $config_file      = $bacula::director::config_file,
) {

  $include_directories = [
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

}

