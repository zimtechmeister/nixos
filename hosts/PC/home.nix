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
    lib.mkDefault "PC";

  programs = {
    git = {
      enable = true;
      userName = "Tim Zechmeister";
      userEmail = "tim.zechmeister03@gmail.com";
    };
  };
}
