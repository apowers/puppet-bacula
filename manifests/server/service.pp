# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::service (
  $ensure       = $bacula::server::service_ensure,
  $enable       = $bacula::server::service_enable,
  $service_name = $bacula::server::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
