#!/bin/sh
echo "------------------------------------"
echo "PyDSA for CentOS 7 offline installer"
echo "------------------------------------"
sleep 3
cd rpm/ && sudo yum install *.rpm -y
sleep 2
cd ../
cd pip && cd setuptools && pip3 install *.whl
cd ../../
sleep 2
cd pip/src/ && tar -xvzf PyVISA-1.10.1.tar.gz && cd PyVISA-1.10.1 && sudo python3 setup.py install
cd ../../../
sleep 2
cd pip/whl/ && sudo pip3 install *.whl
sleep 2
sudo dkms autoinstall
echo "blacklist usbtmc" > /etc/modprobe.d/local-blacklist.conf
echo 'Installation complete, reboot now'

