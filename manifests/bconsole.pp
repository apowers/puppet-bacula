# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::bconsole (
  $options    = $bacula::director::bconsole_options,
  $config_dir = $bacula::director::config_dir,
) {

  $merged_options = { 'Director' => merge($bacula::defaults::default_bconsole_options, $options) }

  file { "${config_dir}/bconsole.conf":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb')
  }

}

