# cli-settings
Stores the settings for :
* [zsh](http://www.zsh.org/)
* [Node.js](https://nodejs.org)
* [Ruby](https://www.ruby-lang.org/en/)
* [Java](https://www.java.com/)
* [Maven](https://maven.apache.org/)
* [Apparix](http://micans.org/apparix/)
* [VIM](http://www.vim.org/)
* [git](https://git-scm.com/)
* [EditorConfig](http://editorconfig.org/)

Some parts of the zsh configuration are taken from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) like the functions for displaying git information in the prompt and the blinks theme.

Although I like the concept of oh-my-zsh very much, I don't use it because it is too slow at startup of a new iTerm tab. Like the nvm configuration it takes 2-3s to load. Therefore I removed oh-my-zsh (together with nvm) from my configuration.

## Usage
The settings make use of [bash-it](https://github.com/Bash-it/bash-it), a community BASH framework with autocompletion, themes, aliases and custom functions.

To make use of these cli-settings:
* Fork the repository.
* Clone it locally.
* Run `install.sh` which will add symbolic links in the home directory to project files.
* Start making modifications as you wish.
