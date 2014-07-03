# == Class: minidlna::configure
#
# Configures the minidlna server
class minidlna::configure {
  $shares = $minidlna::shares

  file { '/etc/minidlna.conf':
    ensure  => present,
    owner   => 'minidlna',
    group   => 'minidlna',
    mode    => '0644',
    content => template('minidlna/minidlna.conf'),
    notify  => Service['minidlna'],
  }
}
