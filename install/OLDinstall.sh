#!/bin/bash
# Unfortunately, the way this is written right now, you have to run it from
# the directory it's in.  Can't do `./install/install.sh`.

# alter this for testing; no trailing slash
# "normal" is `target=$HOME`
target=$HOME/staging
[[ ! -d $target ]] && echo "target dir: $target DNE; exiting" && exit

# could write/update a manifest file if we want to keep track of what's
# being linked.  Would be useful to creating a "sync" capability.

# ls ...DOT* picks up too much (lists subdirs)
for f in `find ../lib -depth 1 -name 'DOT*'`; do
  base=$(basename $f)
  dotname=$(echo $base | sed 's/^DOT/./')

  # http://stackoverflow.com/a/246128 (comments)
  dir="$(( cd "$(dirname "$0")" && pwd ) | sed 's_install$_lib_')"
  realdot="$dir/$base"
  link="$target/$dotname"

  # to just see what's going to happen:
  #echo "ln -s $realdot $link"

  # -e tests for anything (file, dir, link)
  # -h tests for link, but we need to know if *any*thing is there
  [[ ! -e $link ]] && echo "creating $link"
  [[ ! -e $link ]] && $(ln -s $realdot $link)
done

# There should also be an `update` that goes through the lib dir and
# anything that is NOT a DOT* file/dir should be unlinked from the homedir.
# Sort of a `sync` command.

# now set up ~/bin
# maybe a finer-grained method would be better? (ie, not just linking up
# ~/bin, but going inside the dotfiles/bin dir and linking individual
# things -- we'll see)
pathtorealbin="$(( cd "$(dirname "$0")" && pwd ) | sed 's_install$_bin_')"
echo "pathtorealbin: $pathtorealbin"
[[ ! -d $pathtorealbin ]] && echo "$pathtorealbin DNE; exiting" && exit
binlink="$target/bin"
echo "binlink: $binlink"

[[ -e $binlink ]] && echo "$binlink exists; won't overwrite" && exit
echo "creating $binlink"
echo "ln -s $pathtorealbin $binlink"
ln -s $pathtorealbin $binlink
