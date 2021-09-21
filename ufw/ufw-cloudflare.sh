#!/usr/bin/env bash

#########################################################
# This step removes all old public rules before add new #
#########################################################

IFS=$'\n'

# Removing IPv4 HTTP rules in UFW
while true; do
	i=$(sudo ufw status numbered | grep -m1 '80' | awk -F"[][]" '{print $2}')
	if ! [ -z "$i" ]; then
		echo "removing http rule"
        	sudo ufw --force delete $i
	else
		break
	fi
done

# Removing IPv4 HTTPS rules in UFW
while true; do
	i=$(sudo ufw status numbered | grep -m1 '443' | awk -F"[][]" '{print $2}')
	if ! [ -z "$i" ]; then
		echo "removing https rule"
		sudo ufw --force delete $i
	else
		break
	fi
done

##########################################################################################################
# This step adds new rules to the UFW firewall that provide access via HTTP and HTTPS for Cloudflare IPs #
##########################################################################################################

# Adding new IPv4 HTTP rules in UFW
echo "Getting new Cloudflare IPs for IPv4 HTTP"
for i in $(curl "https://www.cloudflare.com/ips-v4"); do
	echo "The new IP address will be added to the UFW firewall for HTTP rule: '$i'"
	sudo ufw allow from $i to any port http
done

# Adding new IPv4 HTTPS rules in UFW
echo "Getting new Cloudflare IPs for IPv4 HTTPS"
for i in $(curl "https://www.cloudflare.com/ips-v4"); do
	echo "The new IP address will be added to the UFW firewall for HTTP rule: '$i'"
	sudo ufw allow from $i to any port https
done