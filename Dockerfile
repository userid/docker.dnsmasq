FROM alpine:latest

MAINTAINER "Gao Jie"

#RUN apk update
#RUN apk --no-cache add dnsmasq
RUN apk add dnsmasq

COPY yhosts.txt /etc/dnsmasq.d/yhosts.txt
COPY dnsmasq.more.conf /etc/dnsmasq.more.conf
RUN echo -e "\nconf-file=/etc/dnsmasq.more.conf\n" >> /etc/dnsmasq.conf

ENTRYPOINT ["dnsmasq","--no-daemon"]

EXPOSE 53 53/udp

