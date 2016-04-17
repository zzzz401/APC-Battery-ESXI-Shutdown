#/bin/sh

#Script from https://thisiscasperslife.wordpress.com/2011/12/04/wmware-esxi-suspend-all-guests/

VMS=`vim-cmd vmsvc/getallvms | grep -v Vmid | awk '{print $1}'`
for VM in $VMS ; do
	PWR=`vim-cmd vmsvc/power.getstate $VM | grep -v "Retrieved runtime info"`
	if [ "$PWR" == "Powered on" ] ; then
		name=`vim-cmd vmsvc/get.config $VM | grep -i "name =" | awk '{print $3}' | head -1 | cut -d """ -f2`
		echo "Powered on: $name"
		echo "Suspending: $name"
		vim-cmd vmsvc/power.suspend $VM > /dev/null &
	fi
done

while true ; do
	RUNNING=0
	for VM in $VMS ; do
		PWR=`vim-cmd vmsvc/power.getstate $VM | grep -v "Retrieved runtime info"`
		if [ "$PWR" == "Powered on" ] ; then
			echo "Waiting..."
			RUNNING=1
		fi
	done
	if [ $RUNNING -eq 0 ] ; then
		echo "Gone..."
		break
	fi
	sleep 1
done
echo "Now we suspend the Host..."
halt
exit 0
