#!/bin/sh

WGET=/usr/bin/wget
HAS_WGET=1
CAN_SUDO=1

command -v /usr/bin/wget >/dev/null 2>&1 || { HAS_WGET=0; }
if [ $HAS_WGET -eq 1 ]; then
    echo "Yay we haz a wget!"
else
    echo "No wget :("
    exit 1
fi

sudo -v || { CAN_SUDO=0; }
if [ $CAN_SUDO -eq 1 ]; then
    echo "Sweet, we have super powers."
    echo "Grabbing dependencies..."
    wget -O - https://raw.github.com/waynew/waynes-world/master/aptgettable.sh | sudo sh 
else
    echo "Uh oh... not sure if there's anything I can do for you..."
    echo "I guess more programming is needed"
    exit 1
fi

exit 0
