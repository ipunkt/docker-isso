#!/bin/sh

if [ -z "$URL" ] ; then
	echo "Missing environment variable: URL."
	echo ""
	echo "Set to the CORS Url from which the frontend will talk with the server."
	echo "Example: https://www.example.com/"
	exit 1
fi

if [ -z "$LISTEN" ] ; then
	LISTEN="http://0.0.0.0:8080/"
fi

if [ -z "$DB" ] ; then
	DB="/db/comments.db"
fi

if [ ! -d /config ] ; then
	mkdir /config
fi

DB_PATH="$(dirname $DB)"

if [ ! -d "$DB_PATH" ] ; then
	mkdir -p "$DB_PATH";
fi

if [ ! -f "$DB" ] ; then
	touch $DB
fi

sed -e "s~%%URL%%~$URL~" \
	-e "s~%%LISTEN%%~$LISTEN~" \
	-e "s~%%DB%%~$DB~" \
	/opt/config/isso.conf.tpl > /config/isso.conf

export ISSO_SETTINGS="/config/isso.conf"
if [ "$#" -gt "0" ] ; then
	$*
else
	chown -R $UID:$GID /db /config

	exec su-exec $UID:$GID gunicorn -b 0.0.0.0:8080 -w 4 --preload isso.run
	#isso -c /config/isso.conf run

fi

