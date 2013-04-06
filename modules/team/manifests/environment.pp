# this actually belongs in it's own file system, e.g.
# modules/mrothco/manifests/environment.pp
# these are the things we decree EVERYONE SHALL HAVE
class team::environment {

  # everyone needs all web browsers for testing!
  include chrome
  include firefox

  # github for mac makes it easier for most people to use git
  # include github::apps::mac #does this exist? or is it a myth?

  # team communication
  include hipchat

  # set the global default ruby (auto-installs it if it can)
  class { 'ruby::global':
    version => '2.0.0'
  }

  # let's make sure everyone has node and coffeescript as a minimum
  include nodejs::v0_10
  nodejs::module { 'coffee-script':
    nodejs_version => 'v0.10'
  }

  # homebrew packages everyone should have
  package {
    [
      'ssh-copy-id'
    ]:
  }

}
