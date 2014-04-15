# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::fd::service (
  $ensure       = $bacula::fd::service_ensure,
  $enable       = $bacula::fd::service_enable,
  $service_name = $bacula::fd::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
