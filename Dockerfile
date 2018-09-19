FROM ubuntu:16.04

MAINTAINER Julia Damerow https://github.com/jdamerow

ARG command=whoami
ARG user_uid=
ARG user_group=
ARG user_name=

RUN if [ "$user_uid" != "" ] ; then useradd -r -u $user_uid -G $user_group $user_name ; else user_name="$(whoami)" ; fi

# run installs in noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get install -y git-all
RUN git clone https://github.com/tmbdev/ocropy.git

WORKDIR ocropy
RUN apt-get install -y wget && apt-get install -y $(cat PACKAGES)
RUN wget -nd http://www.tmbdev.net/en-default.pyrnn.gz && mv en-default.pyrnn.gz models/
RUN python setup.py install

USER $user_name
VOLUME /data
RUN $command
