FROM archlinux:latest

# Set envs
ENV SHELL="/bin/bash"

# Update
RUN pacman -Syyu --noconfirm

# Install additional tools
RUN pacman -S --noconfirm \
	bash zsh \
	vim neovim nano \
	coreutils base-devel tree-sitter-cli \
	lib32-glibc \
	binutils gdb patchelf \
	man-pages man-db \
	python python-pip \
	curl git htop iproute2 inetutils iputils nano ncdu net-tools tar which \
	eza fd hexyl ripgrep tmux

# Install non-pacman packages gef and pwntools
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

CMD ["bash"]
