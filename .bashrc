export PATH=$PATH:~/bin

#bash
export HISTSIZE=10000

#nodejs
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#ruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby

#java
export JAVA_HOME=$(/usr/libexec/java_home)

#bashrc.d
for rcfile in $HOME/.bashrc.d/*.bash; do
  source $rcfile
done
