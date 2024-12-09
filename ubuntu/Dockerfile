FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update
RUN apt -y upgrade

# Install additional tools
RUN apt install -yq \
	vim neovim nano \
	gdb gdbserver patchelf \
	python3 pip \
	iproute2 iputils-ping net-tools

CMD ["bash"]
