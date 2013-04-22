class oh-my-zsh {
  repository {'robbyrussell_oh-my-zsh':
    source => 'robbyrussell/oh-my-zsh',
    path   => "/Users/${::boxen_user}/.oh-my-zsh"
  }
}
