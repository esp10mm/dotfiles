ALL="chrome\nhi"

SELECTED=$( (echo "${ALL}") | rofi -dmenu -p "My Rofi:")
MATCHING=$( (echo "${ALL}") | grep "^${SELECTED}$" )

if [ "${MATCHING}" = "chrome" ]; then 
  exec "google-chrome"
fi
