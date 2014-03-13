# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::server (
  $config_ensure  = 'present',
  $config_options = hash([]),
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $bacula::defaults::server_service_name,
  $package_name   = $bacula::defaults::server_package_name,
  $config_file    = $bacula::defaults::server_config_file,
) inherits bacula::defaults {
  anchor { 'bacula::server::begin':   } ->
  class  { 'bacula::server::package': } ->
  class  { 'bacula::server::config':  } ~>
  class  { 'bacula::server::service': } ->
  anchor { 'bacula::server::end': }
}
