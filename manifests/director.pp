# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::director (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $bacula::defaults::director_service_name,
  $package_name   = $bacula::defaults::director_package_name,
  $config_file    = $bacula::defaults::director_config_file,
  $config_dir     = $bacula::defaults::config_directory,
) inherits bacula::defaults {

  anchor { 'bacula::director::begin':   } ->
  class  { 'bacula::director::package': } ->
  class  { 'bacula::director::config':  } ~>
  class  { 'bacula::director::service': } ->
  anchor { 'bacula::director::end': }

}
