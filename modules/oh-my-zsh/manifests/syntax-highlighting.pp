class oh-my-zsh-syntax-highlighting {
  repository {'zsh-users_zsh-syntax-highlighting':
    source => 'zsh-users/zsh-syntax-highlighting',
    path   => "/Users/${::luser}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting",
  }
}
