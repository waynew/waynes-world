#!/bin/bash
echo "Welcome to Wayne's World!"

CURRENT_VERSION="0.0.1"

printf %s "Checking for wget... "
has_wget=1
command -v /usr/bin/wget >/dev/null 2>&1 || { has_wget=0; }

if [ $has_wget -eq 1 ]; then
    echo "Yes!"
else
    echo "No :("
fi

work_dir="working"
printf %s%s\\n "Making a working directory - " $work_dir
mkdir $work_dir
printf %s%s\\n "Entering " $work_dir
echo "Now in: "
pwd
echo ""
cd $work_dir
printf %s "Attempting to download environment... "

/usr/bin/wget https://github.com/waynew/waynes-world/archive/$CURRENT_VERSION.tar.gz || { echo "Barf - could not download environment. Is the network connection alive?"; exit 1; }

echo "Got the environment, attempting to extract... "
tar -xzvf $CURRENT_VERSION.tar.gz || { echo "Crap. Could not extract release"; exit 1; }
echo "Release extracted, mmm mmm good!"
echo "Entering environment"
cd waynes-world-$CURRENT_VERSION
echo "Do we have root?"
{ sudo -v && echo "Yep! Sweet sassy!"; } || { echo "No root for us :( let's just die for now... Cleanup on aisle 12!"; exit 1;}



echo "Done here, going up!"
cd ..

echo "Leaving working directory"
cd ..
echo "Removing working directory"
rm -r $work_dir

exit 0
