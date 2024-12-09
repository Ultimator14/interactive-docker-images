#!/bin/bash

for d in */
do
	cd $d

	image="ultimator14/${d%/}-interactive:latest"

	echo Pulling $image...
	docker pull $image

	cd ..
done
