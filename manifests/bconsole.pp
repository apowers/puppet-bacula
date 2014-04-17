# == Class: bacula
#
# Full description of class bacula is in the README.
#
class bacula::bconsole (
  $options = {}
) {

  $merged_options = { 'Director' => $options }

  $merged_options = merge($bacula::defaults::default_bconsole_options, $bconsole_options)
  file { "${config_dir}/bconsole.conf":
    ensure  => $ensure,
    mode    => '0440',
    content => template('bacula/config.erb')
  }

}

