# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula (
  $config_ensure  = 'present',
  $config_options = hash([]),
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $bacula::defaults::service_name,
  $package_name   = $bacula::defaults::package_name,
  $config_dir     = $bacula::defaults::config_directory,
  $config_file    = $bacula::defaults::config_file,
) inherits bacula::defaults {
  anchor { 'bacula::begin':   } ->
  class  { 'bacula::package': } ->
  class  { 'bacula::config':  } ~>
  class  { 'bacula::service': } ->
  anchor { 'bacula::end': }
}
