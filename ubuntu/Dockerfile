FROM ubuntu:latest

# Set envs
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_CTYPE=C.UTF-8
ENV SHELL="/bin/bash"

# Update
RUN apt update
RUN apt -y upgrade

# Install additional tools
RUN apt install -yq \
	bash zsh \
	vim neovim nano \
	coreutils build-essential tree-sitter-cli \
	binutils gdb gdbserver patchelf \
	manpages man-db \
	python3 python3-venv pip \
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
# - Treesitter is lazy loaded, force loading via lazy first
# - MasonUpdate does not work because it is not blocking, use install instead
# - TSUpdateSync does not install everything by default at first start, try a second time
RUN nvim --headless "+Lazy update" "+qa"
RUN nvim --headless "+Lazy load all" "+TSUpdateSync" "+qa"
RUN nvim --headless "+Lazy load all" "+MasonInstall debugpy" "+MasonInstall lua-language-server" "+qa"
RUN nvim --headless "+Lazy load all" "+TSUpdateSync" "+qa"

# Initial start (tmux)
RUN tmux new-session -d -s "pluginst" && \
	tmux send-keys -t "pluginst" "tmux run-shell '~/.local/share/tmux/plugins/tpm/scripts/install_plugins.sh'; tmux wait -S sigfinished; exit" C-m && \
	tmux wait sigfinished

# Populate command-not-found-database
RUN apt update

CMD ["bash"]
