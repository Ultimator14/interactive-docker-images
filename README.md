# Interactive Docker Images

## Available Images

- [Alpine](https://hub.docker.com/r/ultimator14/alpine-interactive)
- [Arch](https://hub.docker.com/r/ultimator14/arch-interactive)
- [Kali](https://hub.docker.com/r/ultimator14/kali-interactive)
- [Ubuntu](https://hub.docker.com/r/ultimator14/ubuntu-interactive)

## Run the images

```bash
docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/<image-name>-interactive /bin/bash
```

## Easy usage

You can add one of the following snippets to your `.bashrc` for easy usage.

### Aliases

Simple alias definitions.

```bash
alias alpine='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/alpine-interactive /bin/bash'
alias archlinux='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/archlinux-interactive /bin/bash'
alias kali='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/kali-interactive /bin/bash'
alias ubuntu='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/ubuntu-interactive /bin/bash'
```

Example usage

```bash
# create alpine container
alpine
# create arch container
archlinux
# ...
```

### More complex setup

More complex setup that supports attaching to existing containers.

```bash
create_container() {
	# Args
	# $1 = image
	# $2 = container prefix
	# $3 = container suffix
	local image_name=$1
	local container_prefix=$2
	local container_suffix=$3

	local container_name="${container_prefix}_${container_suffix}"

	echo -e "\e[1;32;40mCreating container $container_name. Reference: \e[1;37;40m$container_suffix\e[0m"
	echo -e "\e[1;34;40mThis is the main shell. If this is closed, other shells referencing this container will also terminate.\e[0m"
	docker run --tty --interactive --rm --name $container_name -v "$PWD":/workdir -w /workdir $image_name /bin/bash
}

attach_container() {
	# Args
	# $1 = container prefix
	# $2 = container suffix
	local container_prefix=$1
	local container_suffix=$2

	local container_name="${container_prefix}_${container_suffix}"

	echo -e "\e[1;32;40mAttaching to container \e[1;37;40m$container_suffix\e[0m"
	docker exec -it "$container_name" /bin/bash
}

create_or_attach_container() {
	# Args
	# $1 = image name
	# $2 = container prefix
	# $3 = user argument
	local image_name=$1
	local container_prefix=$2
	local user_arg=$3

	local used_names=$(docker container ls --filter ancestor=$image_name --format json | jq .Names)

	if [ ! -z "$user_arg" ]; then
		# We have an argument
		local -i container_suffix=$user_arg

		local name_used=$(echo $used_names | grep "${container_prefix}_${container_suffix}")

		if [ -z $name_used ]; then
			# The container does not exist yet, create it
			create_container $image_name $container_prefix $container_suffix
		else
			# The container does already exist
			attach_container $container_prefix $container_suffix
		fi

	else
		# We do not have an argument, create the next free container
		local -i container_suffix=0

		while true
		do
			local name_used=$(echo $used_names | grep "${container_prefix}_${container_suffix}")

			if [ -z $name_used ]; then
				create_container $image_name $container_prefix $container_suffix
				break
			else
				container_suffix=$((container_suffix + 1))
			fi
		done
	fi
}

#alias alpine='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/alpine-interactive /bin/bash'
alpine() { create_or_attach_container "ultimator14/alpine-interactive" "alpine" $1 }

#alias archlinux='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/arch-interactive /bin/bash'
archlinux() { create_or_attach_container "ultimator14/arch-interactive" "arch" $1 }

#alias kali='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/kali-interactive /bin/bash'
kali() { create_or_attach_container "ultimator14/kali-interactive" "kali" $1 }

#alias ubuntu='docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/ubuntu-interactive /bin/bash'
ubuntu() { create_or_attach_container "ultimator14/ubuntu-interactive" "ubuntu" $1 }
```

Example usage
```bash
# window 1
# create container ubuntu_0
ubuntu
# window 2
# create container ubuntu_5
ubuntu 5
# window 3
# attach to container ubuntu_0
ubuntu 0
```
