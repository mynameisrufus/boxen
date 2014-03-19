class people::mynameisrufus {

  include java
  include clojure
  include sysctl
  include postgresql

  include go

  go::version { '1.1.1': }

  include go::1_1

  include projects::all

  postgresql::db { $boxen_user: }

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"
  $devski   = "${home}/.devski"

  repository { $dotfiles:
    source => 'mynameisrufus/dotfiles'
  }

  repository { $devski:
    source => 'mynameisrufus/devski'
  }

  package {
    [
      'wget',
      'gpg2',
      'tmux',
      'ncftp',
      'rtorrent',
      'zsh',
      'ghc',
      'cabal-install',
      'libcouchbase'
    ]:
  }

  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/.gitignore"
  }

  Git::Config::Global <| title == "color.ui" |> {
    value => true
  }

}
