# == Class: bacula
#
# Installs and configures a Bacula client.
# Full description of class bacula is in the README.
#
class bacula::fd (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $bacula::defaults::fd_service_name,
  $package_name   = $bacula::defaults::fd_package_name,
  $config_file    = $bacula::defaults::fd_config_file,
  $config_dir     = $bacula::defaults::config_directory,
) inherits bacula::defaults {
  anchor { 'bacula::fd::begin':   } ->
  class  { 'bacula::fd::package': } ->
  class  { 'bacula::fd::config':  } ~>
  class  { 'bacula::fd::service': } ->
  anchor { 'bacula::fd::end': }
}
