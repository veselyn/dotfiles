_: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - return : /Applications/kitty.app/Contents/MacOS/kitty -1 -d ~

      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      shift + cmd - h : yabai -m window --warp west
      shift + cmd - j : yabai -m window --warp south
      shift + cmd - k : yabai -m window --warp north
      shift + cmd - l : yabai -m window --warp east

      shift + alt - backspace : yabai -m space --balance

      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9
      alt - 0 : yabai -m space --focus 10

      shift + alt - 1 : yabai -m window --space 1
      shift + alt - 2 : yabai -m window --space 2
      shift + alt - 3 : yabai -m window --space 3
      shift + alt - 4 : yabai -m window --space 4
      shift + alt - 5 : yabai -m window --space 5
      shift + alt - 6 : yabai -m window --space 6
      shift + alt - 7 : yabai -m window --space 7
      shift + alt - 8 : yabai -m window --space 8
      shift + alt - 9 : yabai -m window --space 9
      shift + alt - 0 : yabai -m window --space 10

      shift + ctrl - h : yabai -m window --move rel:-10:0
      shift + ctrl - j : yabai -m window --move rel:0:10
      shift + ctrl - k : yabai -m window --move rel:0:-10
      shift + ctrl - l : yabai -m window --move rel:10:0

      shift + alt + cmd - h : yabai -m window --resize left:-10:0; \
        yabai -m window --resize right:-10:0
      shift + alt + cmd - j : yabai -m window --resize bottom:0:10; \
        yabai -m window --resize top:0:10
      shift + alt + cmd - k : yabai -m window --resize top:0:-10; \
        yabai -m window --resize bottom:0:-10
      shift + alt + cmd - l : yabai -m window --resize right:10:0; \
        yabai -m window --resize left:10:0

      ctrl + alt - h : yabai -m window --insert west
      ctrl + alt - j : yabai -m window --insert south
      ctrl + alt - k : yabai -m window --insert north
      ctrl + alt - l : yabai -m window --insert east

      shift + alt - d : yabai -m window --toggle zoom-parent
      shift + alt - f : yabai -m window --toggle zoom-fullscreen

      alt - e : yabai -m window --toggle split

      alt - t : yabai -m window --toggle float

      .blacklist [
        "vmware fusion"
      ]
    '';
  };
}
