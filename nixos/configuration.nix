{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:


{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ./security.nix
    inputs.home-manager.nixosModules.home-manager
  ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Therien";

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  networking.networkmanager.enable = true;
  time.timeZone = "America/Edmonton";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  i18n.defaultLocale = "en_CA.UTF-8";

  swapDevices = [
    {
      device = "/swapfile";
      size = 50000; # 50GB in MB
    }
  ];
  services.udev = {
   packages = [ pkgs.g810-led ];
 };

 services.udev.extraRules = ''
  ACTION=="add", SUBSYSTEM=="usb", RUN+="${pkgs.g810-led}/bin/g810-led -a ff0000"
 '';



  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.variables.EDITOR = "nvim";


  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server = {
      port = 6742;
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      eugene = import ../home-manager/home.nix;
    };
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
      trusted-substituters = ["[invalid url, do not cite]"];
      trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  programs.steam.enable = true;
  programs.firefox.enable = true;
  services.usbmuxd.enable = true;
  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    python311
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    inputs.home-manager.packages.${pkgs.system}.default
    neovim
    ripgrep
    libimobiledevice
    ifuse
    steam
    devenv
    wakatime-cli
    wakapi
    mkvtoolnix-cli
    alacritty
    nvidia-container-toolkit
    docker
    git
    firefox
    gnumake
    steam
    openrgb
  ];

  users.users = {
    eugene = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = [ "wheel" "docker" "networkmanager" ];
      description = "Eugene Lord";
    };
  };

  users.users = {
    clord = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = [ "wheel" "docker" "networkmanager" ];
      description = "Christopher Lord";
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  hardware.graphics = {
    enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.xserver.videoDrivers = [ "nvidia" ];
 

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  system.stateVersion = "24.05";
}
