# this actually belongs in it's own file system, e.g.
# modules/mrothco/manifests/environment.pp
# these are the things we decree EVERYONE SHALL HAVE
class team::environment {

  # everyone needs all web browsers for testing!
  include chrome
  include firefox

  # github for mac makes it easier for most people to use git
  include github_for_mac

  # team communication
  include hipchat

  # all da rubiez
  include ruby::1_8_7
  include ruby::1_9_3
  include ruby::2_0_0

  class { 'ruby::global':
    version => '2.0.0'
  }

  # let's make sure everyone has nodejs and coffeescript as a minimum
  include nodejs::v0_10
  nodejs::module { 'coffee-script':
    node_version => 'v0.10',
    ensure => '1.6.3'
  }
  nodejs::module { 'bower':
    node_version => 'v0.10',
    ensure => '1.0.0'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.10',
    ensure => '0.1.9'
  }
  class { 'nodejs::global':
    version => 'v0.10'
  }

  # homebrew packages everyone should have
  package {
    [
      'ssh-copy-id'
    ]:
  }

}
