class projects::pullcrusher {

  boxen::project { 'pullcrusher':
    ruby    => '1.9.3',
    source  => 'https://github.com/mroth/pullcrusher.git'
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