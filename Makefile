
.PHONY: all

current_dir = $(shell pwd)

all:
	ln -sf $(current_dir)/.zshrc ~/.zshrc
	ln -sf $(current_dir)/.zshenv ~/.zshenv
	ln -sf $(current_dir)/.zprofile ~/.zprofile
	ln -sf $(current_dir)/.zshrc.d ~/
	ln -sf $(current_dir)/.gitconfig ~/.gitconfig
	ln -sf $(current_dir)/.gitignore ~/.gitignore
	ln -sf $(current_dir)/.editorconfig ~/.editorconfig
	ln -sf $(current_dir)/.vimrc ~/.vimrc
	cp ./etc/nix-darwin/flake.nix /etc/nix-darwin/flake.nix
	cd /etc/nix-darwin; darwin-rebuild switch
