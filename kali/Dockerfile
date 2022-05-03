FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt -y upgrade

RUN apt install -yq kali-linux-headless

CMD ["bash"]
