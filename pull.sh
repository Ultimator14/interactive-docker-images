#!/bin/bash

set -e

images=(
	"alpine:latest"
	"archlinux:latest"
	"kalilinux/kali-rolling:latest"
	"ubuntu:latest"
)

for image in "${images[@]}";
do
	echo "Pulling $image"
	docker pull $image
done
