# == Class: minidlna::service
#
# Controls the minidlna service
class minidlna::service {
  $ensure = $minidlna::start ? {true => running, default => stopped}

  service { 'minidlna':
    ensure => $ensure,
    enable => $minidlna::enable,
  }
}
