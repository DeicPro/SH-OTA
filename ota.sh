#SH-OTA v1.2_alpha By Deic & hoholee12

#Edit values
name="your_script.sh"
version="version"
location="/system/xbin"
cloud="https://your_site.com/your_script.sh"

#Don't edit
custom_exit(){
echo "no" > /tmp/SH-OTA.info
exit
}

if [ "`grep $version $location/$name 2>/dev/null`" ]; then
clear
echo "You have the latest version."
sleep 1
custom_exit
fi

while true; do
clear
echo "A new version of the script was found..."
echo
echo "Want install it? (Y/N)"
echo
echo -n "> "
read install_opt
case $install_opt in
y|Y ) echo "yes" > /tmp/SH-OTA.info; break;;
n|N ) custom_exit;;
* ) echo "Write [Y] or [N] and press enter..."; sleep 1;;
esac
done

clear
echo "Downloading..."
sleep 1

curl -k -L -o -s /tmp/$name $cloud
exit
