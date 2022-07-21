swap() {
	case $1 in
	left | bottom | top | right)
		"_swap_$1"
		;;
	esac
}

_swap_left() {
	yabai -m window --swap west
}

_swap_bottom() {
	yabai -m window --swap south
}

_swap_top() {
	yabai -m window --swap north
}

_swap_right() {
	yabai -m window --swap east
}
