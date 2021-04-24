# Info
Online and Offline installation files for PyDSA on Linux CentOS 7.

Supported devices: Rigol DS1054Z (tested)

This repo contains tested instruction to setup PyDSA on CentOS 7.
It also includes offline packets to install everything needed without network support.

# Requirements
Download CentOS 7 DVD image (CentOS-7-x86_64-DVD-2009) from the official [repository](http://isoredirect.centos.org/centos/7/isos/x86_64/).
Tested both physical and virtual machine setup (virtual on VMware Workstation 16).
During the distro installation enable Gnome desktop environment with extra as in pictureS:
![CentOS software options](https://github.com/Limon93/PyDSA/blob/master/CentOS_setup_1of2.png)
![CentOS selection](https://github.com/Limon93/PyDSA/blob/master/CentOS_setup_2of2.png)

Now you have to choose between Online and Offline setup.
I've included offline setup for to avoid any compatibility issue and ensure a fully working setup following a finite number of steps that does not change over time.
The offline setup only works with CentOS 7.

# Online Setup
## Setup NI-VISA 18.2 2018  
    Download NI 2018 from https://www.ni.com/it-it/support/downloads/drivers/download.ni-linux-device-drivers.html#349660 (Downloaded in /Online/files)
	
	1) `sudo yum install rpm_RHEL7CentOS7.rpm`
	2) `sudo yum install ni-visa`
	3) `sudo dkms autoinstall`
	4) reboot your OS

## Test scope

	5) `sudo rmmod usbtmc`
	6) `sudo NIvisaic` 
	7) "USB0::0xXXXX::0xXXXX::DSXXXXXXXXXXXX" should appear in the NIvisaic window

## Install PyVISA and other software

	8) `sudo yum install python3 -y`
	9) `sudo yum install python3-tk* -y`
	10) `sudo pip3 install pyvisa==1.10.1`
	11) `sudo pip3 install pyvisa-py==0.4.1`
	12) `sudo pip3 install pyusb`
	13) `sudo pip3 install scipy numpy`

## Start PyDSA
	
	14) `sudo rmmod usbtmc` (execute at every scope usb replug)
	15) `sudo python3 PyDSA.py`


# Offline Setup
## Install NI-VISA and enable kernel modules

	1) `cd` into /rpm folder
	2) `sudo yum install *.rpm`
	3) `sudo dkms autoinstall`
	4) reboot

## Test scope

	6) `sudo rmmod usbtmc`
	7) `sudo NIvisaic`
	8) "USB0::0xXXXX::0xXXXX::DSXXXXXXXXXXXX" should appear in the NIvisaic window

## Install PyVISA and other software

	5) open terminal in /pip/setuptools folder
	6) `sudo pip3 install *.whl`
	7) unzip the archive /pip/src/PyVISA-1.10.1.tar.gz 
	8) `cd` into extracted /PyVISA-1.10.1
	9) `sudo python3 setup.py install`
	10) `cd` into /pip/whl
	11) `sudo pip3 install *.whl`

## Start PyDSA

	15) `sudo rmmod usbtmc` (execute at every scope usb replug)
	16) `sudo python3 PyDSA.py`


# Tips
If you got a small screen to display full PyDSA window you have to change gnome font scaling factor in Applications -> Accessories -> Tweaks -> Fonts -> Scaling Factor

# Thanks
Many thanks to rheslip, ppmkm and Errmy for the original work.






