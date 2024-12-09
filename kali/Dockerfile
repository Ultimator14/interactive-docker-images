FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_CTYPE=C.UTF-8

# Update
RUN apt update
RUN apt -y upgrade

RUN apt install -yq kali-linux-headless

# Install additional tools
RUN apt install -yq \
	vim neovim nano \
	gdb gdbserver patchelf \
	iputils-ping

# Install non-apt packages gef and pwntools
RUN pip install --user pwntools
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

# Populate command-not-found-database
RUN apt update

CMD ["bash"]
