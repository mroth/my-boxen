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
  ruby::version { '2.1.1': }

  class { 'ruby::global':
    version => '2.1.1'
  }

  # let's make sure everyone has nodejs and coffeescript as a minimum
  include nodejs::v0_10
  class { 'nodejs::global':
    version => 'v0.10'
  }

  # nodejs modules i want globally
  nodejs::module { 'coffee-script':
    node_version => 'v0.10',
    ensure => '1.7.1'
  }
  nodejs::module { 'bower':
    node_version => 'v0.10',
    ensure => '1.2.8'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.10',
    ensure => '0.1.13'
  }
  nodejs::module { 'yo':
    node_version => 'v0.10',
    ensure => '1.1.2'
  }
  nodejs::module { 'generator-webapp':
    node_version => 'v0.10',
    ensure => '0.4.7'
  }


  # homebrew packages everyone should have
  package {
    [
      'ssh-copy-id',
      'imagemagick'
    ]:
  }

  # get rid of boxen default services that were installed in the past
  class { 'nginx':
    ensure => 'absent'
  }
  # class { 'dnsmasq':
  #   ensure => 'absent' #unfortunately this service doesnt have an uninstall! urgh
  # }
  service {"dev.dnsmasq":
    ensure => "stopped",
  }
  package { 'dnsmasq':
    ensure => absent,
  }

}
