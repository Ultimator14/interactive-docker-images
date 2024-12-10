FROM alpine:latest

# Set envs
ENV SHELL="/bin/bash"

# Update
RUN apk --no-cache update
RUN apk --no-cache upgrade

# Install additional tools
RUN apk add --no-cache \
	bash zsh \
	vim neovim nano \
	coreutils build-base tree-sitter-cli \
	binutils gdb patchelf \
	man-pages mandoc docs \
	python3 py3-pip \
	curl git htop iproute2 iputils nano ncdu net-tools shadow tar which \
	eza fd hexyl ripgrep tmux

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

# Refresh package database
RUN apk update

CMD ["/bin/bash"]
