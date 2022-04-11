# Handle Intel vs M1
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    alias oldbrew=/usr/local/bin/brew
else
    eval "$(/usr/local/bin/brew shellenv)"
fi
