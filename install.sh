#! /bin/sh
sudo echo "deb http://http.debian.net/debian stretch main contrib non-free" >> /etc/apt/sources.list
sudo apt-get update #gets latest package lists
sudo apt-get install -y feh make rofi firmware-realtek xorg xserver-xorg-core lightdm tty-clock pulseaudio firmware-iwlwifi git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev rxvt-unicode wicd vim geany chromium w3m w3m-img neofetch imagemagick libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev curl automake libtool --no-install-recommends 

echo "Packages and Dependencies Insatlled, Now Grabbing i3, cava, sconsify"
curl http://apt.mopidy.com/mopidy.gpg | sudo apt-key add - && sudo curl -o /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list
sudo apt-get update && sudo apt-get install -y libportaudio2 libspotify12 --no-install-recommends
cd ~/
mkdir Sconsify/
cd Sconsify/
wget https://github.com/fabiofalci/sconsify/releases/download/v0.4.0-rc2/linux-x86_64-sconsify-0.4.0-rc2.zip
unzip linux-x86_64-sconsify-0.4.0-rc2.zip
cd ~/
git clone https://github.com/karlstav/cava.git
cd ~/cava/
./autogen.sh
./configure
make
sudo make install
cd ~/

echo "Installing wal script from Dylan's github"
git clone https://github.com/dylanaraps/wal.git
mkdir Pictures/
mv ~/wal/wal ~/Pictures/
mv ~/wal/colors/ ~/Pictures/
cd ~/
rm -rf ~/wal/
cd ~/

echo "Installing i3-gaps"
git clone https://www.github.com/Airblader/i3/ i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --dsiable-sanitizers
make
sudo make install
cd ~/

echo "Grabbing dotfiles from my github"
git clone https://github.com/schultzla/dotfiles.git
mv ~/dotfiles/.config/ ~/
mv ~/dotfiles/.bashrc ~/
mv ~/dotfiles/.Xresources ~/
mv ~/dotfiles/Q45T2Qu.jpg ~/Pictures/Q45T2Qu.jpg
mkdir Scripts
mv ~/dotfiles/pipes.sh ~/Scripts/
mv ~/dotfiles/space.sh ~/Scripts/
mv ~/Sconsify/sconsify ~/Scripts/
cd ~/

wget https://github.com/be5invis/Iosevka/releases/download/v1.10.4/01.iosevka-1.10.4.zip
sudo mv 01.iosevka-1.10.4.zip /usr/share/fonts/
cd /usr/share/fonts/
sudo unzip 01.iosevka-1.10.4.zip
cd ~/

echo "Install complete, reboot now"

#etc
