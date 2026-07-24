{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetModule = {
    pkgs,
    config,
    ...
  }: {
    imports = with self.homeModules; [
      desktop
      cli
    ];

    programs.helix.languages.language-server.nixd.config.nixd.options = {
      home-manager.expr = ''(builtins.getFlake (toString ./.)).nixosConfigurations."desktop".options.home-manager.users.type.getSubOptions []'';
    };

    qt.enable = true;
    home.stateVersion = "24.11";

    home.packages = with pkgs; [
      lavat
      alacritty
      spotify
      localsend
      libva-utils
      mission-center
      kdePackages.filelight
      cava
      qutebrowser
      solaar
      pavucontrol
      libnotify
      playerctl
      (pkgs.writeShellScriptBin "fixisaac"
        ''
          pid=$(pgrep -n -f 'isaac-ng.exe')

          sudo ${lib.getExe pkgs.gdb} -q -n -batch -p "$pid" \
          -ex 'set pagination off' \
          -ex 'python inf=gdb.selected_inferior(); inf.write_memory(0x00a9e941, bytes.fromhex("6a 01 ff 15 d8 82 b1 00 e9 50 01 00 00"))' \
          -ex 'python inf=gdb.selected_inferior(); inf.write_memory(0x00a9e9c6, bytes.fromhex("e9 76 ff ff ff"))' \
          -ex 'x/5bx 0x00a9e9c6' \
          -ex 'x/13bx 0x00a9e941' \
          -ex 'detach'
        '')
    ];
  };
}
