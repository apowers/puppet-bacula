# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::defaults {
  $config_directory  = $::osfamily ? {
    'Debian' => '/etc/bacula',
    default  => fail('Unsupported Platform')
  }

  $file_owner  = $::osfamily ? {
    'Debian'  => 'bacula',
    default  => fail('Unsupported Platform')
  }

  $fd_package_name = $::osfamily ? {
    'Debian' => 'bacula-fd',
    default  => fail('Unsupported Platform')
  }
  $fd_config_file  = $::osfamily ? {
    'Debian' => 'bacula-fd.conf',
    default  => fail('Unsupported Platform')
  }
  $fd_service_name = $::osfamily ? {
    'Debian' => 'bacula-fd',
    default  => fail('Unsupported Platform')
  }

  $default_fd_options = {
    'FileDaemon' => {
      'Name'                    => "${::fqdn}-fd",
      'FDport'                  => '9102',
      'WorkingDirectory'        => '/var/lib/bacula',
      'Pid Directory'           => '/var/run/bacula',
      'Maximum Concurrent Jobs' => '20',
      'FDAddress'               => '127.0.0.1',
    },
    'Director' => {
      'Name'      => "${::fqdn}-dir",
      'Password'  => 'password',
    },
    'Messages' => {
      'Name'      => 'Standard',
      'director'  => "${::fqdn}-dir = all, !skipped, !restored",
    }
  }

  $director_package_name = $::osfamily ? {
    'Debian' => ['bacula-server','bacula-console'],
    default  => fail('Unsupported Platform')
  }
  $director_config_file  = $::osfamily ? {
    'Debian' => 'bacula-dir.conf',
    default  => fail('Unsupported Platform')
  }
  $director_service_name = $::osfamily ? {
    'Debian' => ['bacula-director'],
    default  => fail('Unsupported Platform')
  }

  $default_director_options = {
    'Name'                    => "${::fqdn}-dir",
    'DIRport'                 => '9101',
    'QueryFile'               => '"/etc/bacula/scripts/query.sql"',
    'WorkingDirectory'        => '"/var/lib/bacula"',
    'PidDirectory'            => '"/var/run/bacula"',
    'Maximum Concurrent Jobs' => '1',
    'Password'                => 'password',
    'Messages'                => 'Daemon',
    'DirAddress'              => '127.0.0.1',
  }

  $default_bconsole_options = {
    'Name'      => "${::fqdn}-dir",
    'DIRport'   => '9101',
    'Address'   => 'localhost',
    'Password'  => 'password',
  }

  $sd_package_name = $::osfamily ? {
    'Debian' => 'bacula-sd',
    default  => fail('Unsupported Platform')
  }
  $sd_config_file  = $::osfamily ? {
    'Debian' => 'bacula-sd.conf',
    default  => fail('Unsupported Platform')
  }
  $sd_service_name = $::osfamily ? {
    'Debian' => 'bacula-sd',
    default  => fail('Unsupported Platform')
  }

  $default_sd_options = {
    'Storage' => {
      'Name'                    => "${::fqdn}-sd",
      'SDPort'                  => '9103',
      'WorkingDirectory'        => '"/var/lib/bacula"',
      'Pid Directory'           => '"/var/run/bacula"',
      'Maximum Concurrent Jobs' => '20',
      'SDAddress'               => '127.0.0.1'
    },
    'Messages' => {
      'Name'      => 'Standard',
      'director'  => "${::fqdn}-dir = all",
    }
  }

}
