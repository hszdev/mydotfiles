# pacman -S --needed $(cat pkglist)
# yaourt -S $(cat pkglocallist)

cat pacmanpackages.txt | xargs pacman -S --needed --noconfirm
