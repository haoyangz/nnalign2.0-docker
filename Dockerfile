FROM ubuntu:14.04

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
	  apt-get -y upgrade && \
	    apt-get install -y build-essential && \
		  apt-get install -y software-properties-common && \
		    apt-get install -y byobu curl git htop man unzip vim wget && \
			  rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install tcsh
RUN mkdir /scripts/
COPY nnalign-2.0d.Linux.tar.gz /scripts/
RUN cd /scripts/ && tar -zxvf nnalign-2.0d.Linux.tar.gz 
COPY nnalign_docker /scripts/nnalign-2.0/nnalign

WORKDIR /scripts/nnalign-2.0
