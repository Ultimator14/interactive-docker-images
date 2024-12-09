FROM alpine:latest

# Update
RUN apk --no-cache update
RUN apk --no-cache upgrade

# Install additional tools
RUN apk add --no-cache \
	bash \
	vim neovim nano

CMD ["bash"]
