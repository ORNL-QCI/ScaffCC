#!/bin/bash

docker build -t $1 . \
	&& docker run -d -P -it --name scaffcc $1 \
	&& id=$(docker ps -aqf "name=scaffcc") \
	&& docker cp $id:/projects/scaffold-2.0-1.fc25.x86_64.rpm . \
	&& docker stop scaffcc && docker rm -v scaffcc
