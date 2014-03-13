# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::service (
  $ensure       = $bacula::service_ensure,
  $enable       = $bacula::service_enable,
  $service_name = $bacula::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
