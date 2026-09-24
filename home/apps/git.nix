{ pkgs, ... }:

{
  home.packages = [
    pkgs.lazygit
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Matthaeus Heer";
        email = "matthaeusheer@gmail.com";
      };
    };
  };
}
