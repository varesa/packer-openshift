#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
cdrom

# Use graphical install
text

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=link
network  --hostname=localhost.localdomain

# Root password
rootpw password

# System timezone
timezone Europe/Helsinki --isUtc

# Partitioning
ignoredisk --only-use=sda
clearpart --none --initlabel
autopart --type=lvm

# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda

# Repos for the duration of the install
repo --name="EPEL" --baseurl=http://dl.fedoraproject.org/pub/epel/8/x86_64/
repo --name="Base" --baseurl=http://mirror.centos.org/centos/8/os/x86_64/
repo --name="Updates" --baseurl=http://mirror.centos.org/centos/8/updates/x86_64/
repo --name="puppet5" --baseurl=http://yum.puppetlabs.com/puppet5/el/8/x86_64/

# Packages to install
%packages

@^minimal
@core

epel-release
puppet5-release

firewalld 
ipa-client 
puppet-agent 
open-vm-tools

git 
htop 
tcpdump 
tmux 
vim-enhanced 
wget 
zsh

# Not necessary on a server
-alsa-lib
-alsa-firmware
-alsa-tools

# unnecessary firmware
-aic94xx-firmware
-atmel-firmware
-b43-openfwwf
-bfa-firmware
-ipw2100-firmware
-ipw2200-firmware
-ivtv-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl105-firmware
-iwl135-firmware
-iwl2000-firmware
-iwl2030-firmware
-iwl3160-firmware
-iwl3945-firmware
-iwl4965-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6000g2a-firmware
-iwl6000g2b-firmware
-iwl6050-firmware
-iwl7260-firmware
-iwl7265-firmware
-libertas-usb8388-firmware
-ql2100-firmware
-ql2200-firmware
-ql23xx-firmware
-ql2400-firmware
-ql2500-firmware
-rt61pci-firmware
-rt73usb-firmware
-xorg-x11-drv-ati-firmware
-zd1211-firmware

%end

# Done
reboot --eject
