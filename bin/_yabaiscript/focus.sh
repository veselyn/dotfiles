focus() {
  case $1 in
  left | bottom | top | right)
    "_focus_$1"
    ;;
  esac
}

_focus_left() {
  yabai -m window --focus west
}

_focus_bottom() {
  yabai -m window --focus south
}

_focus_top() {
  yabai -m window --focus north
}

_focus_right() {
  yabai -m window --focus east
}
