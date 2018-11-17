FROM node
# Create work directory
RUN mkdir /work
WORKDIR /work

COPY package.json /work/package.json

RUN npm update -y -g npm
RUN apt-get -y update && \
	apt-get -y install make gcc avahi-daemon libavahi-compat-libdnssd-dev && \
	npm install -y && \
	apt-get -y remove make gcc && \
	apt-get -y clean && \
	rm -rf /var/lib/apt

#Workaround
RUN sed -ie 's/$DAEMON -D/$DAEMON --no-chroot -D/g' /etc/init.d/avahi-daemon
RUN sed -ie 's/getaddrinfo()/getaddrinfo({families:[4]})/' node_modules/mdns/lib/browser.js
RUN sed -ie "s/TKK=eval.*?;/TKK='[0-9]+.[0-9]+'/g" /work/node_modules/google-tts-api/lib/key.js

COPY index.js /work/index.js
COPY exec.sh /work/exec.sh

CMD ["/work/exec.sh"]

