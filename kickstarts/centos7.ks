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
repo --name="EPEL" --baseurl=http://dl.fedoraproject.org/pub/epel/7/x86_64/
repo --name="Base" --baseurl=http://mirror.centos.org/centos/7/os/x86_64/
repo --name="Updates" --baseurl=http://mirror.centos.org/centos/7/updates/x86_64/
repo --name="puppet5" --baseurl=http://yum.puppetlabs.com/puppet5/el/7/x86_64/

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

%end

# Done
reboot --eject

