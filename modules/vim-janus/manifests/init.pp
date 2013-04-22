class vim-janus {

  $home = "/Users/${::boxen_user}"

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

}

