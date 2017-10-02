sudo apt-get install git curl i3blocks konsole tmux rofi tmuxinator ranger fonts-font-awesome feh

cd ~
git clone https://github.com/erikw/tmux-powerline.git

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# script for i3 gaps
git clone https://github.com/maestrogerardo/i3-gaps-deb.git
