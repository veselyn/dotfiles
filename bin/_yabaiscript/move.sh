move() {
	case $1 in
	left | bottom | top | right)
		"_move_$1"
		;;
	esac
}

_move_left() {
	yabai -m window --move rel:-10:0
}

_move_bottom() {
	yabai -m window --move rel:0:10
}

_move_top() {
	yabai -m window --move rel:0:-10
}

_move_right() {
	yabai -m window --move rel:10:0
}
