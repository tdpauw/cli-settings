#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/.profile $HOME/.profile
ln -s $DIR/.bashrc $HOME/.bashrc
ln -s $DIR/.bashrc.d $HOME/.bashrc.d
ln -s $DIR/.bash_profile $HOME/.bash_profile
