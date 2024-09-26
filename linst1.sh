echo start
sudo add-apt-repository -y ppa:far2l-team/ppa
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git vlc qbittorrent openssh-server sshfs python3-tk
sudo flatpak install -y com.google.Chrome

sudo apt install -y far2l-gui

mkdir -p ~/filesrv/share
mkdir -p ~/filesrv/torrent

echo done
