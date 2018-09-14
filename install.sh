# apt update
sudo apt update

# softwares
sudo apt-get install -y vim git zsh curl i3blocks tmux rofi tmuxinator ranger fonts-font-awesome feh xclip

cd ~
git clone https://github.com/erikw/tmux-powerline.git

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ycm dependency
sudo apt-get install -y python-dev libxml2-dev libxslt-dev cmake

# script for i3 gaps
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev dh-autoreconf libev-dev libstartup-notification0-dev
cd ~
git clone --recursive https://github.com/Airblader/xcb-util-xrm.git
cd xcb-util-xrm/
./autogen.sh
make
sudo make install
cat > /etc/ld.so.conf.d/i3.conf 
sudo ldconfig
sudo ldconfig -p
cd ~
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -Rf build/
mkdir build
cd build/
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

# font
cd /usr/share/fonts/truetype
sudo wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Retina/complete/Fura%20Code%20Retina%20Nerd%20Font%20Complete%20Mono.otf
sudo fc-cache -f -v 

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
