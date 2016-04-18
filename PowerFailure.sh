#!/bin/bash
touch /home/pi/shutdown.log;
php /home/pi/BatteryAlert.php >> /home/pi/shutdown.log;
ssh root@10.1.1.4 'sh /vmfs/volumes/datastore1/scripts/ESXIShutdown.sh' >> /home/pi/shutdown.log;
ssh -p 1022 root@10.1.1.1 'shutdown -r now' >> /home/pi/shutdown.log;
shutdown 0;
