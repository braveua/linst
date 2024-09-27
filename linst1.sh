echo start
sudo add-apt-repository -y ppa:far2l-team/ppa
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git vlc qbittorrent openssh-server sshfs python3-tk
sudo flatpak install -y com.google.Chrome

sudo apt install -y far2l-gui


#add network hosts
sudo cat <<EOF >> /etc/hosts
192.168.0.5     bravest
192.168.0.10	filesrv
192.168.0.40	white
192.168.0.66    raspi
EOF

#create rsa key for ssh
ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -N '1st key' <<< y
ssh-copy-id brave@192.168.0.10

#настройка подключение шар
mkdir -p ~/filesrv/share
mkdir -p ~/filesrv/torrent
sudo cat <<EOF >> /etc/fstab
# //192.168.0.10/Projects /media/PythonProjects cifs credentials=/home/brave/.smbcred,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777 0 0
# //192.168.0.10/torrent /media/torrent cifs credentials=/home/brave/.smbcred,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777 0 0
# //192.168.0.10/music /media/music cifs credentials=/home/brave/.smbcred,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777 0 0
# //192.168.0.10/torrent /media/torrent cifs credentials=/home/brave/.smbcred,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777 0 0
sshfs#brave@192.168.0.10:/media/3TB/share/ /home/brave/filesrv/share fuse defaults,idmap=user,port=22,allow_other,reconnect,_netdev,users,identityfile=/home/brave/.ssh/id_rsa 0 0
sshfs#brave@192.168.0.10:/media/3TB/torrent/ /home/brave/filesrv/torrent fuse defaults,idmap=user,port=22,allow_other,reconnect,_netdev,users,identityfile=/home/brave/.ssh/id_rsa 0 0
EOF
printf 'user_allow_other\n' | sudo tee -a /etc/fuse.conf
#printf 'sshfs#brave@192.168.0.10:/media/3TB/share/ /home/brave/filesrv/share fuse defaults,idmap=user,port=22,allow_other,reconnect,_netdev,users,identityfile=/home/brave/.ssh/id_rsa 0 0\n' | sudo tee -a /etc/fstab
#printf 'sshfs#brave@192.168.0.10:/media/3TB/torrent/ /home/brave/filesrv/torrent fuse defaults,idmap=user,port=22,allow_other,reconnect,_netdev,users,identityfile=/home/brave/.ssh/id_rsa 0 0\n' | sudo tee -a /etc/fstab
mount -a

echo done
