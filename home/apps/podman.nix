{ pkgs, ... }:

{
  home.packages = [
    pkgs.podman-desktop
    pkgs.docker-compose
  ];
}
