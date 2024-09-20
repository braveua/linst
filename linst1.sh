echo start
sudo add-apt-repository -y ppa:far2l-team/ppa
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git vlc qbittorrent openssh-server
#sudo apt install -y google-chrome-stable
flatpak install com.google.Chrome

sudo apt install -y far2l-gui

echo done
