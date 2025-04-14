{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "eugene";
    homeDirectory = "/home/eugene";
  };

  # System Packages
  home.packages = with pkgs; [
    _1password-gui
    btop
    curl
    darktable
    davinci-resolve
    nodejs_22
    discord
    dunst
    element-desktop
    firefox
    gimp
    glfw3
    gthumb
    helix
    htop
    hyprlock
    godot_4
    xiphos
    makehuman
    blender
    python311
    gcc
    jdk21
    corepack_22
    killall
    kitty
    image-roll
    libnotify
    monero-cli
    upscayl
    monero-gui
    nerdfonts
    openrgb-with-all-plugins
    p2pool
    obs-studio
    patool
    polkit
    prismlauncher
    rofi-wayland
    swww
    vscode
    wayland-protocols
    wineWowPackages.waylandFull
    wl-color-picker
  ];

  # Window Manager
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./desktop/hyprland.nix;
  };



  # Programs
  programs = {
    git.enable = true;
    helix = {
      settings = {
        theme = "onedarker";
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
        keys.normal = {
          space.space = "file_picker";
          space.w = ":w";
          space.q = ":q";
          esc = ["collapse_selection" "keep_primary_selection"];
        };
      };
    };
    home-manager.enable = true;
    neovim.enable = true;
    vscode = {
      enable = true;
      package = pkgs.vscodium.fhs;
    };
    waybar = {
      enable = true;
      settings = import ./desktop/waybar.nix;
    };
  };

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
  };

  # System Services
  systemd.user.startServices = "sd-switch";

  # State Version
  home.stateVersion = "24.05";
}
