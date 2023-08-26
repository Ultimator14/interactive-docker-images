for d in */
do
	cd $d

	image="ultimator14/${d%/}-interactive:latest"

	echo Building $image...
	docker build --pull --no-cache -t $image .

	cd ..
done
