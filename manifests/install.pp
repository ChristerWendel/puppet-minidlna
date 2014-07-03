# == Class: minidlna::install
#
# Installs the minidlna package
class minidlna::install {
  package { 'minidlna':
    ensure => $minidlna::version,
  }
}
