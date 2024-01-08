killall xmobar

if [[ -z $(pgrep redshift) ]]
then
    redshift -l 29.6:52.6 &
fi

cp -f ~/dotfiles/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

xmonad --recompile
xmonad --restart
