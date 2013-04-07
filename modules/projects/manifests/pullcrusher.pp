class projects::pullcrusher {

  boxen::project { 'pullcrusher':
    ruby    => '1.9.3',
    source  => 'mroth/pullcrusher'
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