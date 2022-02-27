resize() {
  case $1 in
  left | bottom | top | right)
    "_resize_$1"
    ;;
  esac
}

_resize_left() {
  if _is_floating; then
    yabai -m window --move rel:-10:0
    return
  fi

  yabai -m window --resize left:-10:0
  yabai -m window --resize right:-10:0
}

_resize_bottom() {
  if _is_floating; then
    yabai -m window --move rel:0:10
    return
  fi

  yabai -m window --resize bottom:0:10
  yabai -m window --resize top:0:10
}

_resize_top() {
  if _is_floating; then
    yabai -m window --move rel:0:-10
    return
  fi

  yabai -m window --resize top:0:-10
  yabai -m window --resize bottom:0:-10
}

_resize_right() {
  if _is_floating; then
    yabai -m window --move rel:10:0
    return
  fi

  yabai -m window --resize right:10:0
  yabai -m window --resize left:10:0
}

_is_floating() {
  is_floating=$(yabai -m query --windows --window | jq '."is-floating"')

  if [ "$is_floating" = false ]; then
    return 1
  fi

  if [ "$is_floating" = true ]; then
    return 0
  fi
}
