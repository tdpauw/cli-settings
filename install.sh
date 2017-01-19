#!/bin/bash
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

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/.profile $HOME/.profile
ln -s $DIR/.bashrc $HOME/.bashrc
ln -s $DIR/.bashrc.d $HOME/.bashrc.d
ln -s $DIR/.bash_profile $HOME/.bash_profile
ln -s $DIR/.apparixrc $HOME/.apparixrc
