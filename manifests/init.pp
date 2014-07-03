# == Class: minidlna
#
# A module to handle minidlna
#
# === Parameters
# ["version"]
#   The package version to install
#
# ['shares']
#   An array of hashes with shares
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class minidlna (
  $version = 'present',
  $shares = [ { type => 'V', path => '/home',} ],
  $enable = true,
  $start = true
  )  {
    class{'minidlna::install': } ->
    class{'minidlna::configure': } ~>
    class{'minidlna::service': } ->
    Class['minidlna']
  }
