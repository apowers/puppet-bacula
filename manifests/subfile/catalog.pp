# Configuration subfile for Bacula.
#

define bacula::subfile::catalog (
  $db_name      = 'bacula',
  $db_address   = 'localhost',
  $db_port      = '3306',
  $db_socket    = undef,
  $db_user      = 'bacula',
  $db_password  = 'password',
  $config_dir   = undef,
) {
  $merged_options = {
    'Catalog'     => {
      'Name'      => $name,
      'DBName'    => $db_name,
      'DBAddress' => $db_address,
      'DBPort'    => $db_port,
      'DBSocket'  => $db_socket,
      'user'      => $db_user,
      'password'  => $db_password,
    }
  }

  $conf_dir_real = $config_dir ? {
    undef   => "${bacula::defaults::config_directory}/catalogs",
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
