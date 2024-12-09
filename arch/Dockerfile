FROM archlinux:latest

# Update
RUN pacman -Syyu --noconfirm

# Install additional tools
RUN pacman -S --noconfirm \
	vim neovim nano \
	python python-pip \
	binutils gcc gdb lib32-glibc patchelf \
	net-tools \
	which

# Install non-pacman packages gef and pwntools
RUN pip install --break-system-packages --user pwntools
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

CMD ["bash"]
