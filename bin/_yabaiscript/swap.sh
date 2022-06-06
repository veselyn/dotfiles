swap() {
  case $1 in
  west | south | north | east)
    yabai -m window --swap "$1"
    ;;
  esac
}
