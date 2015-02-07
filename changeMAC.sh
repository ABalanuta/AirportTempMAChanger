NEW_MAC='18:3D:A2'$(hexdump -n3 -e '/1 ":%02X"' /dev/random)

DEV=$1

if [ -z "$DEV" ];
then
	echo "Usage "$0" [INTERFACE]";
	exit;
fi

sudo ip link set down dev $DEV
sudo ip link set dev $DEV address $NEW_MAC
sudo ip link set up dev $DEV
