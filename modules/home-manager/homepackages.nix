{ pkgs, ... }:

{
    home.packages = with pkgs; [pkgs.sway-contrib.grimshot
        waypaper 
        hyprpaper 
        swaybg
        lua-language-server
        nil
        stylua

        lunar-client
    ];
}
