dotfiles
--------
### Assumptions/etc.

I use bash.

I use vim (& gvim) + pathogen for plugin management.  There's a script
(dotfiles/lib/DOTvim/bundle/install_bundles) to grab bundles.  I'm
being lazy and *not* managing the bundles with git submodules.

I use keychain (from the gentoo project... I think?) for key management.

There's some simple templating in here (all written in bash) to put
private information into dotfiles that need it.  The inspiration
for my "system" (that's overselling reality...) was stolen from
https://github.com/jdevera/dotfiles (who I don't know, but thank you!).
Look at dotfiles/lib/DOT*.template for examples.

### Subdirectories

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
generating dotfiles from templates.
