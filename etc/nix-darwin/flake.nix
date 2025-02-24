{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.devenv
          pkgs.direnv
          pkgs.nmap
          pkgs.inetutils
          pkgs.editorconfig-core-c
          pkgs.unixtools.watch
          pkgs.jq
          pkgs.fzf
          pkgs.gh
          pkgs.hub
          pkgs.asdf-vm
          pkgs.volta
          pkgs.yarn
          pkgs.dive
          pkgs.trivy
        ];

      # Homebrew
      homebrew.enable = true;
      homebrew.onActivation = {
        autoUpdate = false;
        cleanup = "none";
        upgrade = false;
      };
      homebrew.casks = [
        # intalls docker client and docker-compose
        "orbstack"
        "displaylink"
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      nix.settings.trusted-users = [ "thipau" ];

      # touch ID to unlock sudo
      security.pam.enableSudoTouchIdAuth = true;
      system.defaults = {
        # hide dock
        dock.autohide = true;
        # do not rearrange spaces based on most the recent use
        dock.mru-spaces = false;
      };

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#coyote
    darwinConfigurations."coyote" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
