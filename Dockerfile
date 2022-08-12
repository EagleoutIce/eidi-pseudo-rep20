# [alpine] and texlive
FROM docker.io/eagleoutice/lithie-tx-full:latest

# we do not care about caching
USER root
RUN apk add bash python3 make openjdk11
RUN ln -sf python3 /usr/bin/python

RUN pip3 install --no-cache --upgrade pip
WORKDIR /root/data

ENTRYPOINT [ "make" ]
