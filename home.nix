{
  config,
  configs,
  pkgs,
  username,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  imports = [
    # ./modules/theme.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#Default";
      vim = "nvim";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
      nitch
    '';
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec hyprland
      fi
    '';
  };

  home.packages = with pkgs; [
    neovim
    ripgrep
    nixd
    nixfmt
    nodejs
    gcc
    wofi
    nitch
    rofi
    yazi
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        (nix-search-tv.overrideAttrs {
          env.GOEXPERIMENT = "jsonv2";
        })
      ];
      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
    })
  ];

  xdg.configFile = builtins.listToAttrs (
    builtins.map (name: {
      source = create_symlink "${dotfiles}/${name}";
      recursive = true;
    }) configs
  );
}
