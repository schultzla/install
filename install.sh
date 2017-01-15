#! /bin/sh
apt-get update #gets latest package lists
apt-get install -y feh firmware-realtek xorg xserver-xorg-core lightdm tty-clock pulseaudio firmware-iwlwifi git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev rxvt-unicode wicd vim geany chromium w3m w3m-img neofetch imagemagick libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev curl automake libtool --no-install-recommends 

echo "Packages and Dependencies Insatlled, Now Grabbing i3, cava, sconsify"
curl http://apt.mopidy.com/mopidy.gpg | sudo apt-key add - && sudo curl -o /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list
sudo apt-get update && sudo apt-get install -y libportaudio2 libspotify12 --no-install-recommends
cd /home/logan/
mkdir Sconsify/
cd Sconsify/
wget https://github.com/fabiofalci/sconsify/releases/download/v0.4.0-rc2/linux-x86_64-sconsify-0.4.0-rc2.zip
unzip linux-x86_64-sconsify-0.4.0-rc2.zip
cd /home/logan/
git clone https://github.com/karlstav/cava.git
cd /home/logan/cava/
./autogen.sh
./configure
make
sudo make install
cd /home/logan/

echo "Installing wal script from Dylan's github"
git clone https://github.com/dylanaraps/wal.git
mkdir Pictures/
mv /home/logan/wal/wal /home/logan/Pictures/
mv /home/logan/wal/colors/ /home/logan/Pictures/

echo "Installing i3-gaps"
git clone https://www.github.com/Airblader/i3/i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --dsiable-sanitizers
make
sudo make install
cd /home/logan/

echo "Grabbing dotfiles from my github"
git clone https://github.com/schultzla/dotfiles.git
mv /home/logan/dotfiles/.config/ /home/logan/
mv /home/logan/dotfiles/.bashrc /home/logan/
mv /home/logan/dotfiles/.Xresources /home/logan/
mkdir Scripts
mv /home/logan/dotfiles/pipes.sh /home/logan/Scripts/
mv /home/logan/dotfiles/space.sh /home/logan/Scripts/
mv /home/logan/Sconsify/sconsify /home/logan/Scripts/
cd /home/logan/

wget https://github.com/be5invis/Iosevka/releases/download/v1.10.4/02.iosevka-term-1.10.4.zip
sudo mv 02.iosevka.term-1.10.4.zip /usr/share/fonts/
cd /usr/share/fonts/
sudo unzip 02.iosevka.term-1.10.4.zip
cd /home/logam/

echo "Install complete, reboot now"

#etc
