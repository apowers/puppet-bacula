# == Class: bacula
#
# Installs and configures a Bacula sd
# Full description of class bacula is in the README.
#
class bacula::sd (
  $config_ensure    = 'present',
  $config_options   = {},
  $package_ensure   = 'installed',
  $service_ensure   = 'running',
  $service_enable   = true,
  $service_name     = $bacula::defaults::sd_service_name,
  $package_name     = $bacula::defaults::sd_package_name,
  $config_file      = $bacula::defaults::sd_config_file,
  $config_dir       = $bacula::defaults::config_directory,
  $file_owner       = $bacula::defaults::file_owner,
) inherits bacula::defaults {

  anchor { 'bacula::sd::begin': } ->
  class  { 'bacula::sd::package': } ->
  class  { 'bacula::sd::config': } ~>
  class  { 'bacula::sd::service': } ->
  anchor { 'bacula::sd::end': }

}
