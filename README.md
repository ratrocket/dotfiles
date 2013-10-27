dotfiles
--------

* dotfiles/install

Plumbing to install dotfiles in a new environment.

* dotfiles/lib

The actual dotfiles.  Filled with files (or directories) named like
"DOTthing", e.g., DOTbashrc, DOTvim (a directory, btw).

* dotfiles/bin

Will be symlinked to $HOME/bin (it's actual executables & stuff, *not* the
plumbing for dotfiles)

* dotfiles/ignore

A gitignored directory, put private &/or local stuff in here.  I use it for
generating dotfiles from dotfile templates.
