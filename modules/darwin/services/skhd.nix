_:

{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - return : yabaiscript run terminal

      alt - h : yabaiscript focus left
      alt - j : yabaiscript focus bottom
      alt - k : yabaiscript focus top
      alt - l : yabaiscript focus right

      shift + alt - h : yabaiscript swap left
      shift + alt - j : yabaiscript swap bottom
      shift + alt - k : yabaiscript swap top
      shift + alt - l : yabaiscript swap right

      shift + cmd - h : yabaiscript warp left
      shift + cmd - j : yabaiscript warp bottom
      shift + cmd - k : yabaiscript warp top
      shift + cmd - l : yabaiscript warp right

      shift + alt - backspace : yabaiscript space balance

      shift + alt - 1 : yabaiscript space 1
      shift + alt - 2 : yabaiscript space 2
      shift + alt - 3 : yabaiscript space 3
      shift + alt - 4 : yabaiscript space 4
      shift + alt - 5 : yabaiscript space 5
      shift + alt - 6 : yabaiscript space 6
      shift + alt - 7 : yabaiscript space 7
      shift + alt - 8 : yabaiscript space 8
      shift + alt - 9 : yabaiscript space 9
      shift + alt - 0 : yabaiscript space 10

      shift + ctrl - h : yabaiscript move left
      shift + ctrl - j : yabaiscript move bottom
      shift + ctrl - k : yabaiscript move top
      shift + ctrl - l : yabaiscript move right

      shift + alt + cmd - h : yabaiscript resize left
      shift + alt + cmd - j : yabaiscript resize bottom
      shift + alt + cmd - k : yabaiscript resize top
      shift + alt + cmd - l : yabaiscript resize right

      ctrl + alt - h : yabaiscript insert left
      ctrl + alt - j : yabaiscript insert bottom
      ctrl + alt - k : yabaiscript insert top
      ctrl + alt - l : yabaiscript insert right

      shift + alt - d : yabaiscript toggle zoom-parent
      shift + alt - f : yabaiscript toggle zoom-fullscreen

      alt - e : yabaiscript toggle split

      alt - t : yabaiscript toggle float; \
        yabaiscript grid center
    '';
  };
}