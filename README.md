# Adding to whitelist Cloudflare IPs in FirewallD and UFW in the origin server.

##### Author: `[Yuriy Onuk](https://github.com/onuk)`

#### Description: 
This repository includes a few scripts that provide a possibility to automatically whitelist Cloudflare IPs in the FirewallD and UFW firewalls.

##### Instructions for FirewallD:

1) Place this script in the /usr/local/bin/ directory, give it proper permissions. 
```
$ sudo chmod +x /usr/local/bin/firewalld-cloudflare.sh
```

2) Add a new task via the cron job editor
```
$ sudo crontab -e
```

3) In the final step add the following to the last line
```
   15 0 * * * root /usr/local/bin/firewalld-cloudflare.sh
```

##### Instructions for UFW:

1) Place this script in the /usr/local/bin/ directory, give it proper permissions.
```
$ sudo chmod +x /usr/local/bin/ufw-cloudflare.sh
```

2) Add a new task via the cron job editor
```
$ sudo crontab -e
```

3) In the final step add the following to the last line
```
   15 0 * * * root /usr/local/bin/ufw-cloudflare.sh
```

##### Note:
This schedule will run a script every day at 00:15. 
```
15 0 * * * root /usr/local/bin/firewalld-cloudflare.sh
15 0 * * * root /usr/local/bin/ufw-cloudflare.sh
```
If you want to use another time for a run, you can create a new rule using: (https://crontab.guru/)