#
# (C) Copyright 2017 Thierry de Pauw
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
# along with cli-settings.  If not, see <http://www.gnu.org/licenses/>.

# brew link python@3.12 seems broken

readonly python_version=3.12
readonly python_path=$HOMEBREW_PREFIX/opt/python@${python_version}/libexec/bin

export PATH=${python_path}:${PATH}

export VIRTUALENVWRAPPER_PYTHON=${python_path}/python3
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
