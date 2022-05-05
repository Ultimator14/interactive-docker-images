FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt -y upgrade

RUN apt install -yq kali-linux-headless

# Install additional tools
RUN apt install -yq gdb gdbserver iputils-ping patchelf

# Install non-apt packages gef and pwntools
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
RUN pip install pwntools

# Populate command-not-found-database
RUN apt update

CMD ["bash"]
