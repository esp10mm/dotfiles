CUR=$(ibus engine)
if [ "${CUR}" = "chewing" ]; then
  echo 漢
elif [ "${CUR}" = "xkb:us::eng" ]; then
  echo 英 
fi
