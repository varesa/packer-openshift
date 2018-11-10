#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
cdrom

# Use graphical install
text

# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=link
network  --hostname=localhost.localdomain

# Root password
rootpw password

# System services
services --disabled="chronyd"

# System timezone
timezone Europe/Helsinki --isUtc --nontp

# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm

# Partition clearing information
clearpart --none --initlabel

repo --name="EPEL" --baseurl=http://dl.fedoraproject.org/pub/epel/7/x86_64/
repo --name="Base" --baseurl=http://mirror.centos.org/centos/7/os/x86_64/
repo --name="Updates" --baseurl=http://mirror.centos.org/centos/7/updates/x86_64/

%packages
@^minimal
@core
kexec-tools
epel-release
open-vm-tools

%end

#%addon com_redhat_kdump --enable --reserve-mb='auto'
#%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

reboot --eject

