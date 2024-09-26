echo start
sudo add-apt-repository -y ppa:far2l-team/ppa
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git vlc qbittorrent openssh-server sshfs python3-tk
sudo flatpak install -y com.google.Chrome

sudo apt install -y far2l-gui

printf 'sshfs#brave@192.168.0.10:/media/3TB/share/ /home/brave/filesrv/share fuse defaults,idmap=user,port=22,allow_other,reconnect,_netdev,users,identityfile=/home/brave/.ssh/id_rsa 0 0\n' | sudo tee -a /etc/fstab
printf 'sshfs#brave@192.168.0.10:/media/3TB/torrent/ /home/brave/filesrv/torrent fuse defaults,idmap=user,port=22,allow_other,reconnect,_netdev,users,identityfile=/home/brave/.ssh/id_rsa 0 0\n' | sudo tee -a /etc/fstab
mkdir -p ~/filesrv/share
mkdir -p ~/filesrv/torrent


echo done
