# bacula

This is the bacula module.

# Requirements

* Puppetlabs/stdlib

# Installation

  puppet module install seattle-biomed/bacula

# Synopsis

  Install and manage bacula service.

# Parameters

- *config_ensure* (Default: 'present')
- *config_options* (Default: Empty)
- *package_ensure* (Default: 'true')
- *service_ensure* (Default: 'running')
- *service_enable* (Default: 'true')

# Examples

Basic Installation

  include '::bacula'

Parameterized Installation

  $config_options = {
    option => value
  }

  class { '::bacula':
    config_ensure  => 'present',
    config_options => $config_options,
    package_ensure => 'true',
    service_ensure => 'running',
    service_enable => 'true',
  }

Installation with Hiera

  ---
  class:  - bacula
  bacula::config::ensure:  'present'
  bacula::config::options:
    option: value
  bacula::package::ensure:  'true'
  bacula::service::ensure:  'running'
  bacula::service::enable:  'true'

# License

  See LICENSE

# Contact


# Support

Please log tickets and issues at our [Projects site](https://github.com/seattle-biomed/bacula)
