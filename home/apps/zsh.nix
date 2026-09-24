{ pkgs, ... }:

{
  home.packages = [
    pkgs.eza
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "docker" ];
    };

    shellAliases = {
      l = "eza -F";
      ls = "eza -F";
      ll = "eza -lF --git";
      la = "eza -Fa";
      ".." = "cd ..";
      sclip = "wl-paste -n | wl-copy -p";
      vim = "nvim";
      vi = "nvim";
      v = "nvim";
      oldvim = "vim";
      lg = "lazygit";
      c = "clear";
      cl = "claude";

      # Quick-edit shortcuts into the repo source, not the generated (read-only) dotfiles.
      zrc = "nvim ~/code/nix/home/apps/zsh.nix";
      szrc = "source ~/.zshrc";
      kconf = "nvim ~/code/nix/home/apps/kitty.nix";
      vrc = "nvim ~/code/nix/home/apps/nvim.nix";
    };

    initContent = ''
      export EDITOR='nvim'

      zstyle ':completion:*:*:docker:*' option-stacking yes
      zstyle ':completion:*:*:docker-*:*' option-stacking yes
      zstyle ':completion:*:*:make:*' tag-order 'targets'

      if [[ "$(uname -m)" == "aarch64" ]]; then
        export DOCKER_DEFAULT_PLATFORM=linux/amd64
      fi
    '';
  };
}
