yum check-update
yum groupinstall -y "X Window System"
yum install -y gnome-classic-session gnome-terminalnautilus-open-terminal control-center liberation-mono-fonts gnome-terminal.x86_64 cjkuni-ukai-fonts perl firefox  tigervnc-server net-tools
echo -e "VNCSERVERS=\"1:root\"" >>  /etc/sysconfig/vncservers
echo -e  "VNCSERVERARGS[1]=\"-geometry 1280x900\"" >>  /etc/sysconfig/vncservers
cp /usr/lib/systemd/system/vncserver@.service /usr/lib/systemd/system/vncserver@:1.service
sed -i "s/<USER>/root/g"  /usr/lib/systemd/system/vncserver@:1.service
systemctl daemon-reload
systemctl enable vncserver@:1.service
setenforce 0
systemctl stop firewalld.service 
systemctl disable firewalld.service 
vncpasswd
