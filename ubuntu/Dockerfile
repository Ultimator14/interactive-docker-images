FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt -y upgrade

RUN apt install -y iproute2
RUN apt install -y python3 pip
RUN apt install -y gdb gdbserver

CMD ["bash"]
