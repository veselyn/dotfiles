focus() {
  case $1 in
  west | south | north | east)
    yabai -m window --focus "$1"
    ;;
  esac
}
