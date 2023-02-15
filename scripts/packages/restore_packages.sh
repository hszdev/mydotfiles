# pacman -S --needed $(cat pkglist)
# yaourt -S $(cat pkglocallist)

cat packages.lst | xargs pacman -S --needed --noconfirm
