insert() {
  case $1 in
  left | bottom | top | right)
    yabai -m window --insert "$1"
    ;;
  esac
}
