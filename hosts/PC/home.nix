{
  pkgs,
  lib,
  config,
  inputs,
  outputs,
  ...
}: {
  imports = [
    # inputs.self.outputs.homeManagerModules.default
    # could also do cause its thes same as what homeManagerModules is set as in my flake
    ../../homeManagerModules
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
