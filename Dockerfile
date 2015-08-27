FROM debian:wheezy
MAINTAINER EdenServers

#Debian requirements
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install lib32gcc1 wget

#Steamcmd installation
RUN mkdir -p /server/steamcmd
RUN mkdir -p /server/gmod
WORKDIR /server/steamcmd
RUN wget http://media.steampowered.com/client/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN ./steamcmd.sh +login anonymous \
                 +force_install_dir /server/gmod \
                 +app_update 4020 validate \
                 +quit

RUN apt-get install -y openssh-server rssh
ADD rssh.conf /etc/rssh.conf

#Lib fixes (kudos to https://github.com/suchipi/gmod-server-docker)
RUN mkdir /gmod-libs
WORKDIR /gmod-libs
RUN wget http://launchpadlibrarian.net/195509222/libc6_2.15-0ubuntu10.10_i386.deb
RUN dpkg -x libc6_2.15-0ubuntu10.10_i386.deb .
RUN cp lib/i386-linux-gnu/* /server/gmod/bin/
RUN cp /server/steamcmd/linux32/libstdc++.so.6 /server/gmod/bin/
RUN mkdir /root/.steam
RUN mkdir /root/.steam/sdk32/
RUN cp /server/gmod/bin/libsteam.so /root/.steam/sdk32

#Server config
EXPOSE 27015

#Server Start
WORKDIR /server/gmod
ADD start.sh /server/gmod/start.sh
RUN chmod 755 /server/gmod/start.sh

CMD ["/server/gmod/start.sh"]
