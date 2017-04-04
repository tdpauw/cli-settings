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
# along with cli-settings.  If not, see <http://www.gnu.org/licenses/>.

# show help
function bookmark_help() {
    echo "Usage: bt [NAME]"
    echo "Change directory to a bookmark\n"

    bookmark_list
}

# list bookmarks
function bookmark_list() {
    echo "Available bookmarks: \n"
    apparix | sed -n '4,$'p | uniq
    echo ""
}

# bookmark a folder
function bookmark_add() {
    apparix --add-mark $1
}

# to bookmark
function bookmark_to() {
    if [[ $# -gt 0 ]]; then
        folder=$(apparix $1)
        cd $folder
    else
        bookmark_help
    fi
}

# delete bookmark
function bookmark_delete() {
    if [[ $# -gt 0 ]]; then
        apparix -purge-mark $1
        bookmark_list
    else
        bookmark_help
    fi
}

# auto complete
_bookmark_complete() {
    A=$(apparix | sed -n '4,$'p  | awk '{ print $2 }')
    _arguments ":::($A)"
}

compdef _bookmark_complete bookmark_to
compdef _bookmark_complete bookmark_delete

alias to=bookmark_to
alias bl=bookmark_list
alias bm=bookmark
alias bd=bookmark_delete

