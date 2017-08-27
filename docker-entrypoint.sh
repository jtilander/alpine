#!/bin/bash
set -e

trap "exit 1" SIGINT
trap "exit 2" SIGTERM

case "$1" in 
	bash)
		shift
		exec /bin/bash $*
		;;
	info)
		# Run as guest and print out /etc/passwd and some other info.
		exec su-exec guest cat /etc/passwd
		;;

	ping)
		exec /bin/ping -c 4 8.8.8.8
		;;
esac

exec "$@"
