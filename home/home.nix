{ ... }:

{
  imports = [
    ./apps/git.nix
    ./apps/zsh.nix
    ./apps/kitty.nix
    ./apps/starship.nix
    ./apps/nvim.nix
    ./apps/podman.nix
  ];

  home.username = "matt";
  home.homeDirectory = "/home/matt";

  # Bump only when you deliberately want to review home-manager's own
  # backward-incompat changes across versions — not a "target version" knob.
  home.stateVersion = "26.05";

  # Lets home-manager manage itself (adds the `home-manager` CLI).
  programs.home-manager.enable = true;

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];
}
