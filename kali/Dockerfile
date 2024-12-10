FROM kalilinux/kali-rolling:latest

# Set envs
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_CTYPE=C.UTF-8
ENV SHELL="/bin/bash"

# Update
RUN apt update
RUN apt -y upgrade

RUN apt install -yq kali-linux-headless

# Install additional tools
RUN apt install -yq \
	bash zsh \
	vim neovim nano \
	coreutils build-essential tree-sitter-cli \
	binutils gdb gdbserver patchelf \
	manpages man-db \
	python3 pip \
	curl git htop iproute2 iputils-ping nano ncdu net-tools tar which \
	eza fd-find hexyl ripgrep tmux

# Install non-apt packages gef and pwntools
RUN pip install --break-system-packages --user pwntools
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

# Setup userspace tools
RUN git clone --depth=1 https://github.com/Ultimator14/dotfiles.git /usr/local/dotfiles
RUN mkdir -p ~/.config
RUN rm -f ~/.zshrc && ln -s /usr/local/dotfiles/zsh/zshrc.zsh ~/.zshrc
RUN rm -f ~/.tmux.conf && ln -s /usr/local/dotfiles/tmux/tmux.conf ~/.tmux.conf
RUN rm -rf ~/.config/nvim && ln -s /usr/local/dotfiles/nvim ~/.config/nvim

# Initial start (zsh)
RUN zsh -ic exit
RUN sh ~/.local/share/zsh/zinit/plugins/romkatv---powerlevel10k/gitstatus/install

# Initial start (nvim)
RUN nvim --headless "+Lazy update" "+TSUpdateSync" "+MasonUpdate" "+qa"

# Populate command-not-found-database
RUN apt update

CMD ["bash"]
