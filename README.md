## Install Script

Debian install script, grabs all my dotfiles and used packages, moves to directories, installs everything. Should allow for usage for rice install as soon as script is ran

## What It Does

Basically, I made this script for two reasons. First being, as many people probably do, I break my linux setup on the daily with testing out new packages and what not. So I created this install script to get me back to the point I like being. I update the script at random times with any new packages I add that I actually use often. The second reason I made this script was that I noticed that the majority of people use i3-gaps with this similar config. It's the stereotypical setup, so if anyone stumbles upon this having trouble getting to that point, you can use this script as it will get you all the way there. Only a few steps need to be done before using the script

## How To Use (Experienced)

Here I won't explain the steps, but rather just tell you what to do. Install debian using a netinst ISO selecting only system utilities during the install as the packages you want, install sudo, add yourself as a user, install git, clone my install repository, mv the install script from the install folder to ~/, run the script as sudo. 

## How To Use (Beginners)

Note: this is only for debian

1. Install debian stretch using a netinst. Hypothetically you could use the full install but I feel that adds stuff I will never use and I like a lightweight install
2. Only add the system utilities and print server packages when it asks 
3. After install you should boot into debian and have the CLI. Login using your info.
4. At this point you only need to install sudo and git
5. Login to the su user ```su```
6. Install the sudo command ```apt-get install sudo```
7. Add yourself to the list of sudoers ```sudo adduser YOURNAME sudo```
8. Exit the su user, and logout then log back in ```exit && logout```
9. Now install git ```sudo apt-get install git```
10. Clone my repostiory ```git clone https://github.com/schultzla/install```
11. The install.sh script is located in the install folder, just move it from the folder to your ~ ```mv ~/install/install.sh ~/
12. Now just run the install script as sudo ```sudo ./install.sh```
13. The script will run, then it will tell you to reboot when  complete. You should boot into lightdm, make sure you select i3 from the list of WM in the top right corner of lightdm
14. Enjoy!
