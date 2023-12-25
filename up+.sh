#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

# reset - commit your changes or stash them before you merge
# git reset --hard - personal alias - grh

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

# clean up our github
rm -rf etc/skel/.config/rofi/files/
rm -rf etc/skel/.config/rofi/fonts/
rm -rf etc/skel/.config/rofi/previews/
rm -f etc/skel/.config/rofi/LICENSE
rm -f etc/skel/.config/rofi/README.md

rm -rf /tmp/input

	git clone https://github.com/adi1090x/rofi --depth=1  /tmp/input

	rm -rf /tmp/input/.github
	rm /tmp/input/setup.sh

	# CHANGING PATH

	cd /tmp/input
	find .  -type f -exec sed -i "s/rofi\/applets/rofi\/files\/applets/g" {} \;
	find .  -type f -exec sed -i "s/rofi\/colors/rofi\/files\/colors/g" {} \;
	find .  -type f -exec sed -i "s/rofi\/powermenu/rofi\/files\/powermenu/g" {} \;
	find .  -type f -exec sed -i "s/rofi\/images/rofi\/files\/images/g" {} \;
	find .  -type f -exec sed -i "s/rofi\/launchers/rofi\/files\/launchers/g" {} \;
	find .  -type f -exec sed -i "s/rofi\/scripts/rofi\/files\/scripts/g" {} \;

	cd /home/erik/ARCO/ARCOLINUX/arcolinux-rofi

	cp -r /tmp/input/* etc/skel/.config/rofi/

	rm -rf /tmp/input

	tput setaf 2;
	echo "#################################################"
	echo "################  "$name" done"
	echo "#################################################"
	tput sgr0;



# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
		git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
		git push -u origin master
fi

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
