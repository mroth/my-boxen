class oh-my-zsh::plugins::syntax-highlighting {
  repository {'zsh-users_zsh-syntax-highlighting':
    source => 'zsh-users/zsh-syntax-highlighting',
    path   => "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting",
    require => Class['oh-my-zsh']
  }
}
