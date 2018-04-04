ls wallpapers |sort -R |tail -$N |while read file; do
  echo $file
  cp "wallpapers/$file" ~/wall.png
  break;
  # Something involving $file, or you can leave
  # off the while to just get the filenames
done
