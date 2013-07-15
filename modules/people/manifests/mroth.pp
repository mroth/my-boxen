#some of the things I include here *might* be in the default site manifest,
#but to make this more portable I shall include them anyhow despite redundancy.
#in general, I'm going to list everything I consider an "application"... kinda
class people::mroth {

  #include ALL the browsers
  include chrome
  include firefox::release

  #dev-y stuff that i personally want even outside of projects
  include redis
  include heroku

  #text editors i hate the least
  include macvim
  include sublime_text_2
  include mou

  #terminalz
  include zsh
  include iterm2::dev

  #virtual machines
  include vmware_fusion
  include virtualbox
  include vagrant

  #non-dev stuff for general productivity
  include github_for_mac
  include dropbox
  include caffeine
  include sizeup
  include vlc
  include flux
  include transmission
  include evernote

  #non-dev stuff for general unproductivity
  include steam

  #lolcommits is gunna want the below
  include xquartz
  # include imagemagick #fuck boxen's custom bottle, use homebrew

  # some custom modules to add-on to stuff, see modules directory for manifests
  include oh-my-zsh
  include oh-my-zsh::plugins::syntax-highlighting
  include vim-janus
  #TODO: set default color scheme / prefs for iterm2 / install solarized

  #
  # define convenience variables for later
  #
  $home = "/Users/${::boxen_user}"

  #
  # configure git
  #
  git::config::global {
    'user.name':
      value => 'Matthew Rothenberg';
    'user.email':
      value => 'mrothenberg@gmail.com';
    'github.user':
      value => 'mroth';
    'color.ui':
      value => 'true';
    'core.quotepath':
      value => 'false';
    'diff.tool':
      value => 'opendiff';
    'merge.tool':
      value => 'opendiff';
    'push.default':
      value => 'simple';
    'alias.amend':
      value => 'commit --amend -C HEAD';
  }


  #
  # install ST2 configuration and package control stuff
  # TODO: make this override existing non git directories
  # TODO: install ST2 license file?
  #
  repository { 'my-sublime-config':
    source => 'https://github.com/mroth/my-sublime-config.git',
    path   => "${home}/Library/Application Support/Sublime Text 2/Packages/User"
  }
  repository { 'package-control':
    source => 'wbond/sublime_package_control',
    path   => "${home}/Library/Application Support/Sublime Text 2/Packages/Package Control"
  }

  #
  # install and use homeshick for managing dotfiles
  #
  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${home}/.homesick/repos/homeshick"
  }
  -> file { "${home}/.homeshick":
    ensure => 'link',
    target => "${home}/.homesick/repos/homeshick/home/.homeshick"
  }
  -> repository { 'mroth-dotfiles':
    source => 'https://github.com/mroth/dotfiles.git',
    path   => "${home}/.homesick/repos/dotfiles"
  }
  ~> exec { '~/.homeshick link dotfiles':
    refreshonly => true
  }
  #TODO: run the first symlink with force?? or rely on me to do manually in interactive mode

  #
  # install scm_breeze to make CLI git less annoying
  #
  repository { 'scmbreeze':
    source => 'ndbroadbent/scm_breeze',
    path   => "${home}/.scm_breeze"
  }

  # some sensible OSX defaults
  # can eventually replace with https://github.com/boxen/puppet-osx/pull/3 ?
  boxen::osx_defaults {
    "Disable 'natural scrolling'":
      ensure => present,
      key    => 'com.apple.swipescrolldirection',
      domain => 'NSGlobalDomain',
      user   => $::boxen_user,
      value  => 'false',
      type   => 'bool';
    "Set aqua color variant to graphite":
      ensure => present,
      key    => 'AppleAquaColorVariant',
      domain => 'NSGlobalDomain',
      user   => $::boxen_user,
      type   => 'int',
      value  => 6;
  }
  ~> exec { 'killall Finder':
    refreshonly => true
  }

  #TODO: install solarized in various places
  # apple color picker

  # more homebrew packages I personally want
  package {
    [
      'imagesnap', #webcams are meant to be CLI tools
      'pianobar',  #music is meant to be listened to from CLI
      'wget',      #files are meant to be downloaded there too
      'imagemagick'
    ]:
    ensure => present,
  }

}
