apt -y update
apt -y full-upgrade
apt -y install build-essential gdb linux-headers-amd64 cmake clang clangd libclang-dev default-jdk mit-scheme sbcl
apt -y install emacs vim alacritty firefox-esr imagemagick vlc qbittorrent openconnect
apt -y install git scrot fbcat unzip p7zip-full wget curl aria2 ffmpeg htop pkg-config rlwrap redshift texinfo pandoc blueman flatpak
apt -y install xmonad libghc-xmonad-contrib-dev xmobar lxdm suckless-tools neofetch picom nitrogen ttf-bitstream-vera
apt -y autopurge

cp -f fonts/* /usr/local/share/fonts/
cp -f keyboard /etc/default/keyboard

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
