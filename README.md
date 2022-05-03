# Interactive Docker Images

## Available Images

- [Kali](https://hub.docker.com/repository/docker/ultimator14/kali-interactive)
- [Ubuntu](https://hub.docker.com/repository/docker/ultimator14/ubuntu-interactive)

## Run the images

```bash
docker run --tty --interactive --rm -v "$PWD":/workdir -w /workdir ultimator14/<image-name>-interactive /bin/bash
```
