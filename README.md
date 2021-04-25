# Table of contents
* [General info](#Info)
* [Requirements](#Requirements)
* [Online Setup](#Online-Setup)
* [Offline Setup](#Offline-Setup)
* [Tips](#Tips)
* [Thanks](#Thanks)

# Info
Online and Offline installation files for PyDSA Spectrum Analyzer on a fresh Linux CentOS 7 installation.\

Supported devices: Rigol DS1054Z (tested)\

This repo contains tested instructions and an automated script to setup PyDSA on CentOS 7.\
It also includes offline packets to install everything needed without network support.\
Tested 25/04/2021.

# Requirements
Download CentOS 7 DVD image (CentOS-7-x86_64-DVD-2009) from the official [repository](http://isoredirect.centos.org/centos/7/isos/x86_64/).
Tested both physical and virtual machine setup (virtual on VMware Workstation 16).
During the distro installation enable Gnome desktop environment with extra as in pictures:
![CentOS software options](https://github.com/Limon93/PyDSA/blob/master/CentOS_setup_1of2.png)
![CentOS selection](https://github.com/Limon93/PyDSA/blob/master/CentOS_setup_2of2.png)
Remeber to give administrative rights to the user you created.\
If you forgot: from terminal acquire root permissions with `su` and execute `usermod -aG wheel YOURUSERNAME` to add YOURUSERNAME to the sudoers file.\
Download the entire content of this repo somewere on the desktop of your CentOS installation. Unzip and open a terminal inside.\

Now you have to choose between Online and Offline setup.\
I've included offline setup to avoid any compatibility issue and ensure a fully working setup following a finite number of steps that does not change over time.
The offline setup only works with CentOS 7.\

# Online Setup
### A - Setup NI-VISA 18.2 2018  
Download, extract and install NI-VISA 2018 repository installer from [ni.com](https://www.ni.com/it-it/support/downloads/drivers/download.ni-linux-device-drivers.html#349660), (Downloaded in /Online_Setup/files/)

1) `cd` into Online_Setup/files/ 	
2) `sudo yum install rpm_RHEL7CentOS7.rpm`
3) `sudo yum install ni-visa`
4) `sudo dkms autoinstall`

Reboot your system.
	

### B - Test scope

5) Connect your scope and execute `sudo rmmod usbtmc`
6) `sudo NIvisaic` 
7) "USB0::0xXXXX::0xXXXX::DSXXXXXXXXXXXX" should appear in the NIvisaic window

### C - Install PyVISA and other software

8) `sudo yum install python3 -y`
9) `sudo yum install python3-tk* -y`
10) `sudo pip3 install pyvisa==1.10.1`
11) `sudo pip3 install pyvisa-py==0.4.1`
12) `sudo pip3 install pyusb`
13) `sudo pip3 install scipy numpy`
14) `echo 'blacklist usbtmc' | sudo tee -a /etc/modprobe.d/local-blacklist.conf`

### D - Start PyDSA
	
15) `sudo python3 PyDSA.py`


# Offline Setup

### Scripted setup

I wrote a quick shell script to automatically perform the setup.

1) Open a terminal inside the folder Offline_setup
2) Enable execution permission to install.sh with `chmod +x install.sh`
3) `sudo ./install.sh`
4) reboot and launch PyDSA with `sudo python3 PyDSA.py`

Alternatively you can follow the steps below to manually install everything:

### A - Install NI-VISA 18.2 2018

1) `cd` into Offline_Setup/rpm/
2) `sudo yum install *.rpm`
3) `sudo dkms autoinstall`
4) reboot

### B - Test scope

6) `sudo rmmod usbtmc`
7) `sudo NIvisaic`
8) "USB0::0xXXXX::0xXXXX::DSXXXXXXXXXXXX" should appear in the NIvisaic window

### C - Install PyVISA and other software

5) open terminal in Offline_Setup/pip/setuptools/
6) `sudo pip3 install *.whl`
7) unzip the archive Offline_Setup/pip/src/PyVISA-1.10.1.tar.gz 
8) `cd` into extracted PyVISA-1.10.1
9) `sudo python3 setup.py install`
10) `cd` into Offline_Setup/pip/whl/
11) `sudo pip3 install *.whl`
12) `echo 'blacklist usbtmc' | sudo tee -a /etc/modprobe.d/local-blacklist.conf`


### D - Start PyDSA

13) `sudo python3 PyDSA.py`


# Tips
If you got a small screen to display full PyDSA window you have to change gnome font scaling factor in Applications -> Accessories -> Tweaks -> Fonts -> Scaling Factor\
Latest PyVISA crashes PyDSA.

# Thanks
Many thanks to rheslip, ppmkm and Errmy for the original work.






