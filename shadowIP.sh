#!/bin/bash
##ShadowIP Script by Nelson RT
##AnonSurf by Parrotsec
##Tor-Buddy by AfterBurn @ NetSecNow
##Anonsurf IP Rotator By Perseverance###
##colors
export DRED='\e[1;5;31m'
export RED='\e[1;91m'
export DRKGRY='\e[1;90m'
export CYN='\e[1;7;5;96m'
export YLW='\e[1;33m'
export PRPL='\e[1;35m'
export BLUE='\e[1;94m'
export GREEN='\e[1;92m'
export RC='\e[00m'
#banner
echo -e "$YLW                                                         "
echo -e "------------------------------------------------------------ "
echo -e "                       _                                     "
echo -e "                   o  | |                 ()                 "
echo -e "           _          | |  _         _    /\  _   __         "
echo -e "          |/  |  |_|  |/  |/  |   | |/   /  \|/  /           "
echo -e "          |__/ \/  |_/|__/|__/ \_/|/|__//(__/|__/\___/       "
echo -e "                                 /|                          "
echo -e "                                 \|                          "
echo -e "                                                        $RC  "
echo -e "  $RED-ShadowIP Script By evileyeSec$RC$BLUE-[Author: Nelson RT]-$RC "
echo -e "                                                       $YLW  "                                      
echo -e "------------------------------------------------------------ "       
echo -e "                                                        $RC  "

echo -e " $DRKGRY[$BLUE info$RC$DRKGRY ]$DRED Checking necessary tools...$RC\n"
#Check if  Tor is Installed
echo -e " $GREEN*$RC$BLUE Checking if Tor is Installed $RC\n"
TOR="/etc/init.d/tor"

if [ -f $TOR ];
then
echo -e " $DRKGRY[$BLUE +$RC$DRKGRY ]$PRPL Tor Installed! $RC\n"
echo -e " $DRKGRY[$RED *$RC$DRKGRY ]$RED Starting Tor Service for you!... $RC\n"
service tor start
else
echo -e " $DRKGRY[$RED !$DRKGRY ]$RED Tor not installed... fail.. -_- $RC\n"
echo -e " apt-get install tor \n"
exit 
fi

# Check if I2P is installed
I2P="/etc/init.d/i2p" 

if [ -f $I2P ];
then
echo -e " $GREEN*$RC$BLUE CHecking whether I2P Installed $RC\n"
echo -e " $DRKGRY[$BLUE + $RC$DRKGRY ]$PRPL I2P is Installed! $RC\n"
echo -e " $DRKGRY[$BLUE i$RC$DRKGRY ]$RED I2P started! $RC\n"
else
echo -e " $DRKGRY[$RED X$DRKGRY ]$GRAY I2P is not Installed.. -_- $RC"
echo -e " $RED apt-get install i2p $RC\n"
exit
fi

### ProxyChains Check Install###
echo -e " $GREEN*$RC$BLUE Checking if Proxychains Installed $RC\n"
PC="/etc/proxychains.conf"


if [ -f $PC ];
then
echo -e " $DRKGRY[$BLUE i$RC$DRKGRY ]$PRPL Proxychains is Installed! $RC\n"
else
echo -e " $DRKGRY[$RED X$DRKGRY ]$GRAY   Proxychains is not installed.. -_- $RC\n"
echo -e " $RED apt-get install proxychains $RC\n"
exit
fi

# Check if Anonsurf is Installed #
echo -e " $GREEN*$RC$BLUE Check if Anonsurf installed $RC\n"
AS="/etc/init.d/anonsurf"

if [ -f $ANS ];
then
echo -e " $DRKGRY[$BLUE +$RC$DRKGRY ]$PRPL Anonsurf Is Installed! $RC\n"
echo -e " $DRKGRY[$RED *$RC$DRKGRY ]$DRED Starting Shadow Mode...!  $RC\n"
anonsurf start
else
echo -e " $DRKGRY[$RED !$DRKGRY ]$RED Anonsurf not installed... fail.. -_- $RC\n"
echo -e " git clone https://github.com/Und3rf10w/kali-anonsurf.git ~/opt $RC\n"
exit 
fi

## Timeout setup to change Anonsurf IP in Seconds.
echo -e " $GREEN[$RED e$GREEN ]$UBLUE Please enter the time interval in seconds for changing your IP (30 secs recommended)  $RC\n"
read TIME

if [ "$TIME" -lt "30" ];
then
echo -e " $DRKGRY[$RED X$RC$DRKGRY ]$RED WARNING! $BLUE Less than 30 seconds is not recommended due to timeout errors$RC\n"
echo -e " $GREEN However if you encounter issues, restart script. Happy H4CK1NG $RC\n"
##Uncomment the following line to  allow only timers  >=30 sec
#exit 1
else
echo -e " $DRKGRY[$DRED i$RC$DRKGRY ]$BLUE   Setting up timer...Please be patient this might take a while $RC\n"
fi

function control_c {
echo -en " \n$RED THANKS FOR USING OUR SHADOW SERVICES!! $RC\n"
 anonsurf stop
echo -en " $RED Exiting Shadow Mode...!!! $RC\n"
echo -en " $DRKGRY[$GREEN i$DRKGRY ]$GREEN Anonsurf has been stopped. You are no longer Shadow-Walking! $RC\n"
exit $?
}

## Capture SIGINT (Ctrl-C) clean shit up and ROLL OUT!
trap control_c SIGINT

for (( ; ; )) 
do
sleep $TIME

#alert to change IP address
echo -e " $RED-----------------------------------------------------------------$RC\n" 
echo -e " $DRED[ # ]$YLW Change your IP else your chair will sink in quick sand!" 
echo -e "                       $RED |<evileyeSec\>|                         $RC\a\n"
echo -e " $RED-----------------------------------------------------------------$RC\n" 
anonsurf change
echo -e " $DRKGRY[$DRED i$RC$DRKGRY ] $GREEN$TIME$RED Seconds until next IP Change $RC\n"

##uncomment to view ip after every change.
anonsurf myip
echo -e "$BLUE[$GREEN *$BLUE ] Here is your current <node ip/>... ! $RC\n"
done

