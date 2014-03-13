# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::defaults {
  $config_directory  = $::osfamily ? {
    'Debian' => '/etc/bacula',
    default  => fail('Unsupported Platform')
  }
  $package_name = $::osfamily ? {
    'Debian' => 'bacula',
    default  => fail('Unsupported Platform')
  }
  $config_file  = $::osfamily ? {
    'Debian' => 'bacula-fd.conf',
    default  => fail('Unsupported Platform')
  }
  $service_name = $::osfamily ? {
    'Debian' => 'bacula',
    default  => fail('Unsupported Platform')
  }
  $server_package_name = $::osfamily ? {
    'Debian' => 'bacula',
    default  => fail('Unsupported Platform')
  }
  $server_config_file  = $::osfamily ? {
    'Debian' => 'bacula-dir.conf',
    default  => fail('Unsupported Platform')
  }
  $server_service_name = $::osfamily ? {
    'Debian' => 'bacula',
    default  => fail('Unsupported Platform')
  }
}
