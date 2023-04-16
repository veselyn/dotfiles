battery=$(pmset -g batt)
percentage=$(echo "$battery" | grep -Po '\d{1,3}%')
echo "$percentage"
