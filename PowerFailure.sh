#!/bin/bash
php BatteryAlert.php;
ssh root@10.1.1.4 'sh /vmfs/volumes/datastore1/scripts/ESXIShutdown.sh';
ssh -p 1022 root@10.1.1.1 'shutdown 0';
shutdown 0;
