#!/bin/sh

[ "$1" = "toggle" ] && (caffeine kill || caffeine -a &)

[ -z "$(pidof caffeine-ng)" ] && echo "" || echo ""

# if [ "$1" = "toggle" ]; then
    # if [ -z "$(pidof caffeine-ng)" ]; then
        # caffeine -a &
    # else
        # caffeine kill
    # fi
# fi

# if [ -z "$(pidof caffeine-ng)" ]; then
    # echo ""
# else
    # echo ""
# fi
