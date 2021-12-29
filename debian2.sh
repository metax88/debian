sudo apt-get install intel-microcode

sudo apt-get install amd64-microcode

 #sudo apt-get install open-vm-tools open-vm-tools-desktop

 sudo apt-get install i3 xorg suckless-tools

 sudo apt-get install lightdm

 sudo apt-get install xdm

 sudo apt install ranger 

 sudo apt install git make gcc

 git clone https://github.com/Shourai/st.git

 cd /st

 sudo make clean install

 cd 


echo ‘exec i3’ > ~/.xsession

exec_always --no-startup-id $HOME/.config/i3/scripts/helene.sh







