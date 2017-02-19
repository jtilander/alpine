#!/bin/bash
set -e

case "$1" in 
	bash)
		shift
		exec /bin/bash $*
		;;
	ping)
		exec /bin/ping -c 4 8.8.8.8
		;;
esac

exec "$@"
