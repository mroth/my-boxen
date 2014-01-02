# this actually belongs in it's own file system, e.g.
# modules/mrothco/manifests/environment.pp
# these are the things we decree EVERYONE SHALL HAVE
class team::environment {

  # everyone needs all web browsers for testing!
  include chrome
  include firefox

  # github for mac makes it easier for most people to use git
  include github_for_mac

  #heroku style development
  include heroku
  include foreman

  # team communication
  include hipchat

  # all da rubiez
  ruby::version { '1.8.7': }
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }

  class { 'ruby::global':
    version => '2.1.0'
  }

  # let's make sure everyone has nodejs and coffeescript as a minimum
  include nodejs::v0_10
  nodejs::module { 'coffee-script':
    node_version => 'v0.10',
    ensure => '1.6.3'
  }
  nodejs::module { 'bower':
    node_version => 'v0.10',
    ensure => '1.2.8'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.10',
    ensure => '0.1.11'
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
