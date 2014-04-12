class people::mroth {
  $HOME = "/Users/${::boxen_user}"

  #dev-y stuff that i personally want even outside of projects
  include redis
  include heroku  #TODO: move to team?
  include foreman #TODO: move to team?

  #terminalz
  include zsh
  include xquartz
  # below are custom modules, see modules directory for manifests
  include oh-my-zsh
  include oh-my-zsh::plugins::syntax-highlighting
  include vim-janus
  # TODO: set default color scheme / prefs for iterm2 / install solarized

  #
  # ~/Applications -- via brewcask
  #
  package {
    [
      # webdevs need all the webs (except opera lol)
      'google-chrome',
      'firefox',

      # text editors i hate the least
      'sublime-text',
      'mou',

      # virtual machines
      'vagrant',         # probably put this in team
      'virtualbox',      # probably put this in team
      'vmware-fusion',

      # other dev tools
      'dash',
      'github',

      # non-dev stuff for general productivity
      'dropbox',
      'caffeine',
      'sizeup',
      'vlc',
      'flux',
      'transmission',
      'evernote',
      'cloud',

      # non-dev stuff for general unproductivity
      'steam',
      'spotify',
    ]:
    provider => 'brewcask'
  }

  # CLI tools -- via homebrew
  package {
    [
      # dev/programming tools and languages
      'go',
      'jq',
      'macvim',

      # network tools
      'curl',
      'wget',

      # security tools
      'gnupg',
      'nmap',
      'pwgen',

      # media related tools
      #  (I always want imagemagick but not listed here since it's in team,
      #   and the homebrew provider in boxen can't have duplicates) :-/
      'ffmpeg',
      'imagesnap',
      'pianobar',

    ]:
    ensure => present
  }

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
  # let's just install package control on new machines now since i'm moving away
  # from ST2 in favor of Atom
  #
  # repository { 'my-sublime-config':
  #   source => 'https://github.com/mroth/my-sublime-config.git',
  #   path   => "${HOME}/Library/Application Support/Sublime Text 2/Packages/User"
  # }
  repository { 'package-control':
    source => 'wbond/sublime_package_control',
    path   => "${HOME}/Library/Application Support/Sublime Text 2/Packages/Package Control"
  }

  #
  # Atom text editor
  # no one has made stuff to manage in boxen just yet but starting a list
  # so I can manage my modules here eventually
  #
  # must have modules:
  #  - editorconfig
  #  - atom-alignment
  #  - vim-mode
  #  - language-puppet
  #  - toggle-quotes
  #  - travis-ci-status
  #

  #
  # DOTFILES
  #  - install and use homeshick for managing dotfiles
  #  - install my dotfiles
  #
  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${HOME}/.homesick/repos/homeshick"
  }
  -> file { "${HOME}/.homeshick":
    ensure => 'link',
    target => "${HOME}/.homesick/repos/homeshick/home/.homeshick"
  }
  -> repository { 'mroth-dotfiles':
    source => 'https://github.com/mroth/dotfiles.git',
    path   => "${HOME}/.homesick/repos/dotfiles"
  }
  ~> exec { "${HOME}/.homeshick link dotfiles --force":
    refreshonly => true
  }

  #
  # install scm_breeze to make CLI git less annoying
  #
  repository { 'scmbreeze':
    source => 'ndbroadbent/scm_breeze',
    path   => "${HOME}/.scm_breeze"
  }

  #
  # some sensible OSX defaults
  #
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
    "disables Dashboard":
      user   => $::boxen_user,
      domain => 'com.apple.dashboard',
      key    => 'mcx-disabled',
      value  => true;
  }
  ~> exec { 'killall Finder':
    refreshonly => true
  }
  # some more settings from puppet-osx
  include osx::global::enable_keyboard_control_access
  include osx::no_network_dsstores
  include osx::dock::dim_hidden_apps
  class { 'osx::dock::icon_size':
    size => 42
  }

  # in case of lost device (yeah right)
  # also gives my phone number to the entire interweb yay opensource
  osx::recovery_message { 'If found, please call +1 5102067426': }

  #TODO: install solarized in various places
  # such as apple color picker

}
