# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::director::package (
  $ensure       = $bacula::director::package_ensure,
  $package_name = $bacula::director::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
