#! /bin/sh
#Adding non-free source, getting all packages and dependencies
echo "deb http://http.debian.net/debian stretch main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt-get update #gets latest package lists
sudo apt-get install -y mednafen cmatrix ncmpcpp mopidy mopidy-spotify alsa-utils feh make rofi firmware-realtek xorg xserver-xorg-core lightdm tty-clock pulseaudio firmware-iwlwifi git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev rxvt-unicode wicd vim geany w3m w3m-img neofetch imagemagick libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev curl automake libtool --no-install-recommends 

#Removing install folder from cloning into my repository
echo "Cleaning up some files"
rm -rf install/

#Installing google chrome (chromium extensions don't work so I use chrome)
echo "Installing chrome browser and dependencies"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f
rm -rf google-chrome-stable_current_amd64.deb
cd ~/

#FFTW is a dependency not in the official packages for cava
echo "Installing fftw package for cava"
wget www.fftw.org/fftw-3.3.6.tar.gz
tar -xzf fftw-3.3.6.tar.gz
cd fftw-3.3.6.tar.gz
./configure
make
sudo make install
cd ~/
rm -rf fftw-3.3.6.tar.gz
rm -rf fftw-3.3.6/

#Installing cava
echo "Packages and Dependencies Insatlled, Now Grabbing cava"
cd ~/
git clone https://github.com/karlstav/cava.git
cd ~/cava/
./autogen.sh
./configure
make
sudo make install
rm -rf ~/cava/
cd ~/

#Installing wal theming script
echo "Installing wal script from Dylan's github"
git clone https://github.com/dylanaraps/wal.git
mkdir Pictures/
mv ~/wal/wal ~/Pictures/
mv ~/wal/colors/ ~/Pictures/
cd ~/
rm -rf ~/wal/
cd ~/

#Installing i3-gaps
echo "Installing i3-gaps"
git clone https://www.github.com/Airblader/i3/ i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd ~/
rm -rf i3-gaps/
mkdir Scripts

#Clones my dotfiles repo, moves all necesssary files to their respective spots, makes it so first boot has everything ready, no extra steps needed
echo "Grabbing dotfiles from my github"
git clone https://github.com/schultzla/dotfiles.git
mv ~/dotfiles/.config/ ~/
mv ~/dotfiles/.bashrc ~/
mv ~/dotfiles/.Xresources ~/
mv ~/dotfiles/Q45T2Qu.jpg ~/Pictures/Q45T2Qu.jpg
chmod +x ~/dotfiles/pipes.sh
chmod +x ~/dotfiles/space.sh
mv ~/dotfiles/pipes.sh ~/Scripts/
mv ~/dotfiles/space.sh ~/Scripts/
mv ~/dotfiles/.ncmpcpp/config ~/.ncmpcpp/config
cd ~/
rm -rf dotfiles/

#Gets Iosevka font, my choice for the terminal
echo "Installing Iosevka font (used for terminal)"
wget https://github.com/be5invis/Iosevka/releases/download/v1.10.4/01.iosevka-1.10.4.zip
sudo mv 01.iosevka-1.10.4.zip /usr/share/fonts/
cd /usr/share/fonts/
sudo unzip 01.iosevka-1.10.4.zip
cd ~/

echo "Install complete, if you want to use Spotify+NCMPCPP, edit ~/.config/mopidy/mopidy.conf with your login details. Reboot now"

#etc
