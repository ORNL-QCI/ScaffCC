#!/bin/bash

docker build -t $1 . \
	&& docker run -d -P -it --name scaffcc $1 \
	&& id=$(docker ps -aqf "name=scaffcc") \
	&& docker cp $id:/projects/scaffold_2.0_amd64.deb . \
	&& docker stop scaffcc && docker rm -v scaffcc
