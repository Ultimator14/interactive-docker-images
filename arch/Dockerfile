FROM archlinux:latest

# Update
RUN pacman -Syyu --noconfirm

# Install additional tools
RUN pacman -S --noconfirm vim neovim nano
RUN pacman -S --noconfirm python python-pip
RUN pacman -S --noconfirm binutils gcc gdb lib32-glibc patchelf
RUN pacman -S --noconfirm net-tools
RUN pacman -S --noconfirm which

# Install non-apt packages gef and pwntools
RUN pip install --user pwntools
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

CMD ["bash"]
