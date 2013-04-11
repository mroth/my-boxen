#some of the things I include here *might* be in the default site manifest,
#but to make this more portable I shall include them anyhow despite redundancy.
#in general, I'm going to list everything I consider an "application"... kinda
class people::mroth {

  #include ALL the browsers
  include chrome
  include firefox

  #dev-y stuff that i personally want even outside of projects
  include redis
  include heroku

  #text editors i hate the least
  include macvim
  include sublime_text_2
  include mou
  #TODO: janus for macvim

  #terminalz
  include zsh
  include oh-my-zsh                      #custom module
  include oh-my-zsh::syntax-highlighting #custom module
  include iterm2::dev
  #TODO: set default color scheme / prefs for iterm2 / install solarized

  #virtual machines
  include vmware_fusion
  include virtualbox #because we haven't forked over $ for the vagrant vmware plugin yet
  include vagrant

  #non-dev stuff for general productivity
  include dropbox
  include caffeine
  include sizeup
  include vlc
  include flux

  #lolcommits is gunna want the below
  include xquartz
  include imagemagick

  #
  # define convenience variables for later
  #
  $home = "/Users/${::boxen_user}"

  #Install Janus #(move this to module? probably)
  repository { 'janus':
    source => 'carlhuda/janus',
    path   => "${home}/.vim",
  }
  ~> exec { 'Bootstrap Janus':
    command     => 'rake',
    cwd         => "${home}/.vim",
    refreshonly => true,
    environment => [
      "HOME=${home}",
    ],
  }

  #
  # TODO: un-ignore vintage mode for ST2
  # TODO: install package control for sublime text 2
  # 
  # additional packages I want:
  #  - alignment
  #  - gitgutter
  #  - puppet
  #  - coffeescript
  #  - surround
  #  - vintage-surround
  #  - sublime-linter
  #

  #install and use homeshick for managing dotfiles
  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${home}/.homesick/repos/homeshick"
  }
  repository { 'mroth-dotfiles':
    source => 'mroth/dotfiles',
    path   => "${home}/.homesick/repos/dotfiles"
  }
  file { "${home}/.homeshick":
    ensure => 'link',
    target => "${home}/.homesick/repos/homeshick/home/.homeshick"
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
      value  => 'false';
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
      'pianobar'  #music is meant to be listened to from CLI
    ]:
    ensure => present,
  }

}
