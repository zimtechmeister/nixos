{
  pkgs,
  lib,
  config,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.self.outputs.homeManagerModules.default
  ];

  hyprland.monitorLayout =
    lib.mkDefault "t480";
 
  home.username = "tim";
  home.homeDirectory = "/home/tim";

  programs = {
    git = {
      enable = true;
      userName = "Tim Zechmeister";
      userEmail = "tim.zechmeister03@gmail.com";
    };
  };
}
