class projects::emojistatic {

  boxen::project { 'emojistatic':
    ruby    => '2.0.0',
    source  => 'git@github.com:mroth/emojistatic.git'
  }

  package {
    [
      'advancecomp',
      'gifsicle',
      'jpegoptim',
      'jpeg',
      'optipng',
      'pngcrush'
    ]:
    ensure => present,
  }
}