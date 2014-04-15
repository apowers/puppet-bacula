# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::sd::package (
  $ensure       = $bacula::sd::package_ensure,
  $package_name = $bacula::sd::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
