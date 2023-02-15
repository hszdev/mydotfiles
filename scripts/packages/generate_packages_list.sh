# Inspired by https://bbs.archlinux.org/viewtopic.php?pid=587956#p587956

pacman -Qqe | grep -v "$(pacman -Qqm)" > packages.lst
