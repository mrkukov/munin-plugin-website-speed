#!/bin/bash

# user agent
ua='munin/website_speed (https://github.com/mrkukov/munin-plugin-website-speed)';

output_config() {
	echo "graph_title Website responce time seconds"
	echo "graph_vlabel Website curl responce time in seconds"
	echo "graph_category network"
	echo "graph_args --lower-limit 0 --upper-limit 11 --rigid"
	echo "graph_info This test uses curl to fetch a website and measures the time it took. Results are in seconds."
	echo "github.label github.com"
	echo "google.label google.com"
}

curl_site () {
	curl -w ".value %{time_total}\n" -o /dev/null -s "$2" -m 10 | while read line ; do echo "$1"$line ; done
}

output_values() {
	curl_site github https://github.com/
	curl_site google https://google.com/
}

output_usage() {
	printf >&2 "https://github.com/mrkukov/munin-plugin-website-speed"
}

case $# in
    0)
        output_values
        ;;
    1)
        case $1 in
            config)
                output_config
                ;;
            *)
                output_usage
                exit 1
                ;;
        esac
        ;;
    *)
        output_usage
        exit 1
        ;;
esac
