# [alpine] and texlive
FROM docker.io/eagleoutice/lithie-tx-full:latest

# we do not care about caching
USER root
RUN apk add bash python3 make openjdk11
RUN ln -sf python3 /usr/bin/python

# sloppy rename for alpine; no perl-rename :C
COPY data/rename-fb /bin/rename-fb
RUN chmod +x /bin/rename-fb

RUN pip3 install --no-cache --upgrade pip
WORKDIR /root/data

ENTRYPOINT [ "make" ]
