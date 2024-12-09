#!/bin/bash

for d in */
do
	cd $d

	image="ultimator14/${d%/}-interactive:latest"

	echo Pushing $image...
	docker push $image

	cd ..
done
