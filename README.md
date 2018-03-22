# munin-plugin-website-speed
Munin Plugin for monitoring the responce time of a website. The plugin uses curl to fetch the site and measures the time it took. There's 10 sec timeout so over 10 sec means the page did not respond in that time.

## Setup the sites to be polled
Notice that the name of the site cannot contain dots. So change the name "github.com" into "github-com" or anything you like ("github" is fine). The real address needs to be FQDN with protocol ( https://github.com )

1. `git clone https://github.com/mrkukov/munin-plugin-website-speed`
2. `cd munin-plugin-website-speed`
3. `chmod +x website_speed.sh`
4. `nano website_speed.sh`
- add a new site to the output_config function
- add the site also to the output_values function
5. try to run it: `./website_speed.sh`

## Setup plugin into munin

1. `ln -s /etc/munin/plugins/website_speed /your/own/path/to/website_speed.sh`
2. `nano /etc/munin/plugin-conf.d/munin-node`
- Add to the end:
```
[website_speed*]
user root
```
3. Check: `munin-run website_speed`
4. Check: `munin-run website_speed config`
5. Restart munin-node: `service munin-node restart`
