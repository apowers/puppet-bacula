# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::package (
  $ensure       = $bacula::package_ensure,
  $package_name = $bacula::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
