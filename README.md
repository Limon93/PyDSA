DS1054Z specific version of Spectrum Analyzer for the Rigol DS1000 series digital scopes

Changes to rheslips version: 

1. PyVISA version 1.10.1
2. Tested under Linux (CentOS 7).
3. NI-VISA 18.2 (2018) used.

Installation instructions for Linux (CentOS 7) (2020-01-10):

1. Install NI-VISA for Linux : 
    Tutorial from NI available as of 2020-01-11:
        Instrument Control in Linux Tutorial http://www.ni.com/tutorial/2816/en/
    Download Page : http://www.ni.com/product-documentation/54754/en/    
    
    Installation steps :
      - download zip package "NI Linux Device Drivers.zip"
      - extract package
      - (as root) install NI-visa yum repository: yum localinstall rpm_RHEL7CentOS7.rpm
      - (as root) install ni-visa itself: yum install ni-visa
    
    Verify installation:
     Try out NI VISA interactive control: NIvisaic. IF you plugged in your scope then it should be visible 
     for DS1054Z the line reads 
      USB0::0x14AB1::0x04CE::DSZA<serialnumberhere>::INSTR
         

2. Getting USB scope to work with NI-VISA:
     If in the NI-VISA Intercative Control your scope appears under unknown not under USB Instruments 
     then you need (probably, I did) to make sure the Linux usbtmc driver does not grab the scope. 
     Either remove the module after plugging in the cope manually: rmmod usbtmc  
     or blacklist Linux usbtmc driver in /etc/modprobe.d.       
         
     
    
    
       
Original README.md by rheslip is under ORIGREAME.md

