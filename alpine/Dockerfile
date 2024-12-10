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
RUN nvim --headless "+Lazy update" "+TSUpdateSync" "+MasonUpdate" "+qa"

#RUN nvim --headless "+Lazy! update" "+qa"
#RUN nvim --headless "+TSUpdateSync" "+qa"
#RUN nvim --headless "+MasonUpdate" "+qa"
#RUN nvim --headless "+lua require('lazy').update({ wait=true, show=true })" "+qa"

CMD ["/bin/bash"]
