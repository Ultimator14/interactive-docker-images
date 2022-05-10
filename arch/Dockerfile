FROM archlinux:latest

RUN pacman -Syyu --noconfirm

# Install additional tools
RUN pacman -S --noconfirm python python-pip
RUN pacman -S --noconfirm vim neovim nano
RUN pacman -S --noconfirm gdb binutils gcc-multilib lib32-glibc

# Install non-apt packages gef and pwntools
RUN pip install --user pwntools

CMD ["bash"]
