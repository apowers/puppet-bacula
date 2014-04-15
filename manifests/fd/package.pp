# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::fd::package (
  $ensure       = $bacula::fd::package_ensure,
  $package_name = $bacula::fd::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
