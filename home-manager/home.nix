# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "eugene";
    homeDirectory = "/home/eugene";
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
   home.packages = with pkgs; [ 
   element-desktop
   discord
   helix
   killall
   kitty
   gimp
   curl
   dunst
   p2pool
   kdePackages.falkon
  monero-cli
  gthumb
  zed-editor
  monero-gui
   wayland-protocols
   nerdfonts
   libnotify
   davinci-resolve
   swww
   alacritty
  htop
  btop
   rofi-wayland
  hyprlock
  _1password-gui
  darktable
   glfw3
   wl-color-picker
   polkit
   prismlauncher
   openrgb-with-all-plugins
   jdk21
   firefox
   patool
    wineWowPackages.waylandFull
   ];

  # Import the Hyprland settings from ./hyprland/hyprland.nix
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./desktop/hyprland.nix;
      
    };

#waybar
  programs.waybar = {
    enable = true;
    settings = import ./desktop/waybar.nix;
      
    };

    programs.helix = {
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
    esc = [ "collapse_selection" "keep_primary_selection" ];
    };
  };
};



   xdg.portal.enable = true;
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];



  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
