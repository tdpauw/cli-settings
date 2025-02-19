
.PHONY: all
all:
	cp ./etc/nix-darwin/flake.nix /etc/nix-darwin/flake.nix
	cd /etc/nix-darwin; darwin-rebuild switch

