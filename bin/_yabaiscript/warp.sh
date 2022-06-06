warp() {
  case $1 in
  left | bottom | top | right)
    "_warp_$1"
    ;;
  esac
}

_warp_left() {
  yabai -m window --warp west
}

_warp_bottom() {
  yabai -m window --warp south
}

_warp_top() {
  yabai -m window --warp north
}

_warp_right() {
  yabai -m window --warp east
}
