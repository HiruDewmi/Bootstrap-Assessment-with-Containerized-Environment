#!/bin/bash


# Reading the server timezone

TIMEZONE=`cat /etc/timezone`
echo "Server time zone is: $TIMEZONE"


#Reading the time from worldtime API for server time zone

URL="http://worldtimeapi.org/api/timezone/$TIMEZONE"

FETCH_UNIX_TIME=$(curl "$URL" | jq -r '.unixtime')
SERVER_UNIX_TIME=$(date '+%s')

echo "Fetched UNIX Time: $FETCH_UNIX_TIME"
echo "Server UNIX Time: $SERVER_UNIX_TIME"


# Comapre the Fetched and Server times in unix format
if [ "$FETCH_UNIX_TIME" = "$SERVER_UNIX_TIME" ]; then
    echo "Fetched Time and Server TIme are equal."
else
    echo "Fetched Time and Server TIme are not equal."
fi


# Update the fetched time and server time dynamically in the web server

DISPLAY_FETCH_TIME=$(printf '%(%F %T)T\n' $FETCH_UNIX_TIME)
DISPLAY_SERVER_TIME=$(printf '%(%F %T)T\n' $SERVER_UNIX_TIME)


sed -i "/Fetched time/c\Fetched time: '$DISPLAY_FETCH_TIME'" /usr/share/nginx/html/index.html
sed -i "/Local time/c\Local time: '$DISPLAY_SERVER_TIME'" /usr/share/nginx/html/index.html
#sed -i '/Container id/c\Container id: jsdhf' /usr/share/nginx/html/index.html


# Check if the web server is accessible

HTTP_CODE=$(curl --write-out "%{http_code}\n" "http://localhost:80" --output output.txt --silent)
echo "Response Code from web server: $HTTP_CODE"

if [ "$HTTP_CODE" = "200" ]; then
	echo "Web server is responding the status code 200"
else
	echo "Web server is not responding the status code 200"
fi
