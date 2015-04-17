FROM debian:latest

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

RUN apt-get update
RUN apt-get install -y curl

ADD ./startup.sh /startup.sh
RUN chmod +x /startup.sh

WORKDIR /opt
RUN curl -o teamspeak3-server_linux-amd64.tar.gz http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN tar xzf teamspeak3-server_linux-amd64.tar.gz && mv teamspeak3-server_linux-amd64 teamspeak
RUN rm -f teamspeak3-server_linux-amd64.tar.gz

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

VOLUME ["/data"]

CMD ["/startup.sh"]