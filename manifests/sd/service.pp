# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::sd::service (
  $ensure       = $bacula::sd::service_ensure,
  $enable       = $bacula::sd::service_enable,
  $service_name = $bacula::sd::service_name,
  $restart      = $bacula::defaults::sd_restart_command,
) {
  service { $service_name:
    ensure      => $ensure,
    enable      => $enable,
    hasrestart  => true,
    restart     => $restart,
  }
}
