#!/usr/bin/env sh

insert() {
	case $1 in
	left | bottom | top | right)
		"_insert_$1"
		;;
	esac
}

_insert_left() {
	yabai -m window --insert west
}

_insert_bottom() {
	yabai -m window --insert south
}

_insert_top() {
	yabai -m window --insert north
}

_insert_right() {
	yabai -m window --insert east
}
