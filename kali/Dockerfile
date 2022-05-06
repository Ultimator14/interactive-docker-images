FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_CTYPE=C.UTF-8

RUN apt update
RUN apt -y upgrade

RUN apt install -yq kali-linux-headless

# Install additional tools
RUN apt install -yq vim neovim nano
RUN apt install -yq gdb gdbserver
RUN apt install -yq iputils-ping patchelf

# Install non-apt packages gef and pwntools
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
RUN pip install pwntools

# Populate command-not-found-database
RUN apt update

CMD ["bash"]
