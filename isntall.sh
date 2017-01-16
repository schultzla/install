#! /bin/sh
echo "deb http://http.debian.net/debian stretch main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt-get update #gets latest package lists
sudo apt-get install -y alsa-utils feh make rofi firmware-realtek xorg xserver-xorg-core lightdm tty-clock pulseaudio firmware-iwlwifi git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev rxvt-unicode wicd vim geany w3m w3m-img neofetch imagemagick libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev curl automake libtool --no-install-recommends 

echo "Cleaning up some files"
rm -rf install/

echo "Installing chrome browser and dependencies"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f
rm -rf google-chrome-stable_current_amd64.deb
cd ~/

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

echo "Packages and Dependencies Insatlled, Now Grabbing i3, cava, sconsify"
curl http://apt.mopidy.com/mopidy.gpg | sudo apt-key add - && sudo curl -o /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list
sudo apt-get update && sudo apt-get install -y libportaudio2 libspotify12 --no-install-recommends
cd ~/
wget https://github.com/fabiofalci/sconsify/releases/download/v0.4.0-rc2/linux-x86_64-sconsify-0.4.0-rc2.zip
unzip linux-x86_64-sconsify-0.4.0-rc2.zip
rm -rf linux-x86_64-sconsify-0.4.0-rc2.zip
chmod +x sconsify
mkdir Scripts
mv sconsify ~/Scripts/
cd ~/
git clone https://github.com/karlstav/cava.git
cd ~/cava/
./autogen.sh
./configure
make
sudo make install
rm -rf ~/cava/
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
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd ~/
rm -rf i3-gaps/

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
cd ~/
rm -rf dotfiles/

wget https://github.com/be5invis/Iosevka/releases/download/v1.10.4/01.iosevka-1.10.4.zip
sudo mv 01.iosevka-1.10.4.zip /usr/share/fonts/
cd /usr/share/fonts/
sudo unzip 01.iosevka-1.10.4.zip
cd ~/

echo "Install complete, reboot now"

#etc
