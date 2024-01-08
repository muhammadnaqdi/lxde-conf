mkdir -p ~/backgrounds ~/gits ~/keys ~/media ~/scripts ~/tmp ~/.xmonad ~/.config/alacritty ~/binary ~/projects ~/dotfiles/xmonad

cp -f autostart ~/.config/lxsession/LXDE/autostart
cp -f xmonad/xmonad.hs ~/.xmonad/xmonad.hs
cp -f vimrc ~/.vimrc
cp -f init.el ~/.emacs
cp -f xmobarrc ~/.xmobarrc
cp -f alacritty.yml ~/.config/alacritty/alacritty.yml
cp -f scripts/* ~/scripts/
cp -f xmonad/* ~/dotfiles/xmonad

if [[ -z $(grep '# user' ~/.profile) ]]
then
    cat profile >> ~/.profile
fi

# systemctl --user enable emacs
