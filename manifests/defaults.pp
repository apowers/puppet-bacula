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
  $fd_restart_command = $::osfamily ? {
    'Debian' => '/usr/sbin/service bacula-fd restart',
    default  => fail('Unsupported Platform')
  }

  $default_fd_options = {
    'Name'                    => "${::fqdn}-fd",
    'FDport'                  => '9102',
    'WorkingDirectory'        => '/var/lib/bacula',
    'Pid Directory'           => '/var/run/bacula',
    'Maximum Concurrent Jobs' => '20',
    'FDAddress'               => $::fqdn,
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
  $dir_restart_command = $::osfamily ? {
    'Debian' => '/usr/sbin/service bacula-director reload',
    default  => fail('Unsupported Platform')
  }

  $default_director_options = {
    'Name'                    => "${::fqdn}-dir",
    'DIRport'                 => '9101',
    'QueryFile'               => '"/etc/bacula/scripts/query.sql"',
    'WorkingDirectory'        => '"/var/lib/bacula"',
    'PidDirectory'            => '"/var/run/bacula"',
    'MaximumConcurrentJobs'   => '1',
    'Password'                => 'password',
    'Messages'                => 'Daemon',
    'DirAddress'              => $::fqdn,
  }

  $default_bconsole_options = {
    'Name'      => "${::fqdn}-dir",
    'DIRport'   => '9101',
    'Address'   => $::fqdn,
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
  $sd_restart_command = $::osfamily ? {
    'Debian' => '/usr/sbin/service bacula-sd restart',
    default  => fail('Unsupported Platform')
  }

  $default_sd_options = {
    'Storage' => {
      'Name'                    => "${::fqdn}-sd",
      'SDAddress'               => $::fqdn,
      'SDPort'                  => '9103',
      'WorkingDirectory'        => '"/var/lib/bacula"',
      'PidDirectory'            => '"/var/run/bacula"',
      'MaximumConcurrentJobs'   => '20',
    },
    'Messages' => {
      'Name'      => 'Standard',
      'Append'    => '"/var/log/bacula/bacula-sd.log" = all, !skipped',
      'Director'  => "${::fqdn}-dir = all",
    }
  }

}
