FROM node:10
# Create work directory
RUN mkdir /work
WORKDIR /work

RUN npm update -y -g npm
RUN apt-get -y update && \
	apt-get -y install make gcc avahi-daemon libavahi-compat-libdnssd-dev && \
	npm install https://github.com/knaou/google-home-notifier && \
	apt-get -y remove make gcc && \
	apt-get -y clean && \
	rm -rf /var/lib/apt

#Workaround
RUN sed -ie 's/$DAEMON -D/$DAEMON --no-rlimits --no-chroot -D/g' /etc/init.d/avahi-daemon
RUN sed -ie 's/getaddrinfo()/getaddrinfo({families:[4]})/' node_modules/mdns/lib/browser.js

COPY index.js /work/index.js
COPY exec.sh /work/exec.sh

CMD ["/work/exec.sh"]

