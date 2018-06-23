#!/bin/sh

set -e

/etc/init.d/dbus start
/etc/init.d/avahi-daemon start

cd /work
node index.js

/etc/init.d/avahi-daemon stop
/etc/init.d/dbus stop

