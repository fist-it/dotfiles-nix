{ self, config, pkgs, ... }:

{
  imports = [
    ./brew.nix
  ];

  system.primaryUser = "fist-it";
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
    [
      vim
      wget
      git
      zoxide
    ];



  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;
  # services.nix-daemon.enable = true;

  users.users.fist-it = {
    name = "fist-it";
    home = "/Users/fist-it";
    uid = 501;
  };
}
