# this actually belongs in it's own file system, e.g.
# modules/mrothco/manifests/environment.pp
# these are the things we decree EVERYONE SHALL HAVE
class team::environment {

  # we want everyone to be able to use brewcask as a provider
  # and we'll start using it in the team setup too!
  include brewcask

  # all da rubiez
  ruby::version { '1.8.7': }
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.2': }
  class { 'ruby::global':
    version => '2.1.2'
  }
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

  # let's make sure everyone has nodejs and coffeescript as a minimum
  include nodejs::v0_10
  class { 'nodejs::global':
    version => 'v0.10'
  }

  # nodejs modules everyone should have globally
  nodejs::module {
    [
      'coffee-script',
      'bower',
      'grunt-cli',
      'yo'
    ]:
    node_version => 'v0.10'
  }


  # homebrew packages everyone should have
  package {
    [
      'ssh-copy-id',
      'imagemagick',
      'heroku-toolbelt',
      'forego'
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
