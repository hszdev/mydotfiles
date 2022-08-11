#! /bin/sh

bluetoothctl power on
echo -e "agent on\n" | bluetoothctl
echo -e "pair 04:CB:88:B3:49:C7\n" | bluetoothctl
echo -e "trust 04:CB:88:B3:49:C7\n" | bluetoothctl
echo -e "connect 04:CB:88:B3:49:C7\n" | bluetoothctl
sleep 10
