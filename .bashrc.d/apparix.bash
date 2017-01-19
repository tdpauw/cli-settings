#
# (C) Copyright 2016 Thierry de Pauw
#
# This file is part of cli-settings.

# cli-settings is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Foobar is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

function to () {
  if test "$2"; then
    cd "$(apparix --try-current-first -favour rOl "$1" "$2" || echo .)"
  elif test "$1"; then
    if test "$1" == '-'; then
      cd -
    else
      cd "$(apparix --try-current-first -favour rOl "$1" || echo .)"
    fi
  else
    cd $HOME
  fi
}
function bm () {
  if test "$2"; then
    apparix --add-mark "$1" "$2";
  elif test "$1"; then
    apparix --add-mark "$1";
  else
    apparix --add-mark;
  fi
}
function portal () {
  if test "$1"; then
    apparix --add-portal "$1";
  else
    apparix --add-portal;
  fi
}
# function to generate list of completions from .apparixrc
function _apparix_aliases ()
{ cur=$2
  dir=$3
  COMPREPLY=()
  nullglobsa=$(shopt -p nullglob)
  shopt -s nullglob
  if let $(($COMP_CWORD == 1)); then
    # now cur=<apparix mark> (completing on this) and dir='to'
    # Below will not complete on subdirectories. swap if so desired.
    # COMPREPLY=( $( cat $HOME/.apparix{rc,expand} | grep "j,.*$cur.*," | cut -f2 -d, ) )
    COMPREPLY=( $( (cat $HOME/.apparix{rc,expand} | grep "\<j," | cut -f2 -d, ; ls -1p | grep '/$' | tr -d /) | grep "\<$cur.*" ) )
  else
    # now dir=<apparix mark> and cur=<subdirectory-of-mark> (completing on this)
    dir=`apparix --try-current-first -favour rOl $dir 2>/dev/null` || return 0
    eval_compreply="COMPREPLY=( $(
      cd "$dir"
      \ls -d $cur* | while read r
      do
        [[ -d "$r" ]] &&
        [[ $r == *$cur* ]] &&
          echo \"${r// /\\ }\"
      done
    ) )"
  eval $eval_compreply
  fi
  $nullglobsa
  return 0
}
# command to register the above to expand when the 'to' command's args are
# being expanded
complete -F _apparix_aliases to
