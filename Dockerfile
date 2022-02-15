FROM nginx:latest

COPY ./site-content/index.html /usr/share/nginx/html/index.html

# Add the script to the Docker Image
ADD bootstrap_script.sh /mnt/bootstrap_script.sh

# Give execution rights on the cron scripts
RUN chmod 0644 /mnt/bootstrap_script.sh

#Install Cron and JQ
RUN apt-get update && apt-get -y install cron && apt-get -y install jq

ADD crontab_source /mnt/crontab_source

RUN crontab /mnt/crontab_source

#CMD ["cron", "-f"]
CMD [ "sh", "-c", "cron && nginx -g 'daemon off;'" ]
