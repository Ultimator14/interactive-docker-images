FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update
RUN apt -y upgrade

# Install additional tools
RUN apt install -y vim neovim nano
RUN apt install -y python3 pip
RUN apt install -y gdb gdbserver patchelf
RUN apt install -y iproute2 iputils-ping net-tools

CMD ["bash"]
