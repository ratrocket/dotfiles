dotfiles
--------
### How

Run `install` from inside the install subdirectory.

Set `dest_dir` in install (in `install_home()`) to change install
directory.  $HOME is normal, but can alter for testing.

### Assumptions/etc.

bash

vim (& gvim) + pathogen for plugin management.  There's a script
(dotfiles/lib/DOTvim/bundle/install_bundles) to grab bundles.  I'm being
lazy and *not* managing the bundles with git submodules.

keychain (from the gentoo project... I think?) for key management.

There's some simple templating in here (all written in bash) to put
private information into dotfiles that need it.  The inspiration for my
"system" (that's overselling reality...) was stolen from
https://github.com/jdevera/dotfiles (who I don't know, but thank you!).
Look at `dotfiles/lib/DOT*.template` for examples.

### Subdirectories

* dotfiles/install

Plumbing to install dotfiles in a new environment.

* dotfiles/lib

The actual dotfiles.  Filled with files (or directories) named like
"DOTthing", e.g., DOTbashrc, DOTvim (a directory, btw).

* dotfiles/bin

Will be symlinked to $HOME/bin (it's actual executables & stuff, *not*
the plumbing for dotfiles)

* dotfiles/packages

Misnamed directory to hold lists of installed packages (in case of
needing to rebuild).

* dotfiles/ignore

A gitignored directory, put private &/or local stuff in here.  I use it
for generating dotfiles from templates.

### OS X tips

- Stop push notifaction daemon (for Facetime?):
  `sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist`
  (cf.  http://blog.nu42.com/2014/09/stop-your-mac-from-keeping-perpetual.html)

- Stop CalendarAgent (I can't be using it...):
  `launchctl unload -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist`
  (cf. http://superuser.com/questions/490056/how-can-i-disable-the-calendar-agent-from-running-on-mac-os-x-lion)
  (cf. http://www.dgkapps.com/blog/osx-tips/osx-tips-turn-off-disable-calendaragent-from-the-command-line/)

  But, will this cause it to launch at startup?
  11:18 ~/devel/dotfiles (master)$ launchctl list | grep -i cal
  => 0 com.apple.CalendarAgentLauncher
