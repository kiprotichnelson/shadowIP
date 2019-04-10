             _                              
         o  | |                 ()          
 _          | |  _         _    /\  _   __  
|/  |  |_|  |/  |/  |   | |/   /  \|/  /    
|__/ \/  |_/|__/|__/ \_/|/|__//(__/|__/\___/
                       /|                   
                       \|             

http://evileyesec.blogspot.com

Brief description
------------------

Stand-alone script to run on Kali Linux and Parrot Security OS.
It should work on other Linux Distros too.

Disclaimer:

This script is for educational purposes only. Any mis-use is at the liability of the user.


Usage:

First Install Tor and proxychains.

Navigate to the directory of extracted the script
Make the script executable by running the following terminal command.

chmod u+x shadowIP.sh


Run the script as root type:
./shadowIP.sh

By default the script will check to see if you have tor and proxy chains installed. It will then ask you to type in a number in seconds for each request for a new proxy IP from tor. You should use a number of at least 30 seconds or more to avoid conflicts. If you enter a value less than 30 it will warn you, but it will proceed anyway, because you are free to make your own choices :-)


Notes:

When using this script with nmap, hydra, or any other type of scanner via the proxychains command it is recommended that you use a value of at least 120 seconds for IP requests. Anything less has been known to produce unstable scanning output results. 120-240 is a safe bet. Adjust to your needs.

Also, you should make some changes to proxychains.conf located in etc/

The default value for strict_chain should be commented out, and the value for dynamic_chain should be un-commented and used instead. This is because we are using tor, and the tor network has been known to have slow proxy hosts, and otherwise would lead to a break in the chain. You may also want to comment out the proxy_dns option, because things like nmap have been unstable with this option enabled. Instead, add your DNS nameserver addresses to resolv.conf in etc/, this way you can still spoof your IP via proxy, and prevent DNS leaks as well, without breaking nmap. A good place to find Anonymous and Open DNS servers is http://wiki.opennicproject.org/Tier2
Also make sure that the socks5 is enabled. 

Visit our blog and click around :-)

Enjoy!                        
                       
#shadowIP
