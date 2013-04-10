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
  # include hipchat #only needed if org needs it so put in team profile
  include dropbox
  include caffeine
  include sizeup
  include vlc
  include flux

  #lolcommits is gunna want the below
  include xquartz
  include imagemagick

  #Install Janus #(move this to module? probably)
  repository { 'janus':
    source => 'carlhuda/janus',
    path   => "/Users/${::luser}/.vim",
  }
  ~> exec { 'Bootstrap Janus':
    command     => 'rake',
    cwd         => "/Users/${::luser}/.vim",
    refreshonly => true,
    environment => [
      "HOME=/Users/${::luser}/",
    ],
  }

  #install and use homeshick for managing dotfiles
  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "/Users/${::luser}/.homesick/repos/homeshick"
  }
  repository { 'mroth-dotfiles':
    source => 'mroth/dotfiles',
    path   => "/Users/${::luser}/.homesick/repos/dotfiles"
  }
  file { "/Users/${::luser}/.homeshick":
    ensure => 'link',
    target => "/Users/${::luser}/.homesick/repos/homeshick/home/.homeshick"
  }

  # some sensible OSX defaults
  # can eventually replace with https://github.com/boxen/puppet-osx/pull/3 ?
  boxen::osx_defaults { 
    "Disable 'natural scrolling'":
      key    => 'com.apple.swipescrolldirection',
      domain => 'NSGlobalDomain',
      value  => 'false';
  }
  #TODO: no more aqua colors

  # more homebrew packages I personally want
  package {
    [
      'imagesnap', #webcams are meant to be CLI tools
      'pianobar'  #music is meant to be listened to from CLI
    ]:
    ensure => present,
  }

  #TODO: dotfiles!

}
