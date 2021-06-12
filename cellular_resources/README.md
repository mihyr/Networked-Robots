# Some cellular resources
## Modes to connect your robot to the internet using SIM
- [PPP](https://github.com/sixfab/Sixfab_PPP_Installer) via `ppp0` 
- [QMI](https://docs.sixfab.com/page/qmi-interface-internet-connection-setup-using-sixfab-shield-hat) via `wwan0` 
- [ECM](https://docs.sixfab.com/page/internet-connection-with-quectel-ec25-by-using-ecm-mode) via `usb0` 
## AT commands 
```
sudo minicom -D /dev/ttyUSB2 -b 115200
AT+GSN #Request International Mobile Equipment Identity (IMEI)
AT+CIMI #Request International Mobile Subscriber Identity (IMSI)
AT+QCCID #Show ICCID
AT+CGSN #Request Product Serial Number Identification

#reboot
AT+CFUN=1,1
```
- [Further Resources on AT commands](https://m2msupport.net/m2msupport/atcsq-signal-quality/)
- [Routing Guide](https://netbeez.net/blog/linux-set-route-priorities/)