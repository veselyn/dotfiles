warp() {
  case $1 in
  west | south | north | east)
    yabai -m window --warp "$1"
    ;;
  esac
}
