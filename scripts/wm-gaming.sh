killall xmobar
killall redshift

cp -f ~/dotfiles/xmonad/xmonad.noborder.hs ~/.xmonad/xmonad.hs

xmonad --recompile
xmonad --restart
