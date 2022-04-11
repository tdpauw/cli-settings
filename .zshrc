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

export PATH=$PATH:~/bin

#zshrc.d
for rcfile in $HOME/.zshrc.d/*.zsh; do
  source $rcfile
done

function random {
  env LC_CTYPE=C tr -dc 'A-Za-z0-9/_&#!' </dev/urandom | fold -w $1 | head -n 1
}
