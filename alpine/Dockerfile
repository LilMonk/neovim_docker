FROM alpine:latest

LABEL \
        maintainer="rahulsahoo66@gmail.com" \
        url.github="https://github.com/LilMonk/neovim_docker"
        # url.dockerhub="https://hub.docker.com/r/LilMonk/neovim_docker/"


ENV \
        UID="1000" \
        GID="1000" \
        UNAME="neovim" \
        GNAME="neovim" \
        SHELL="/bin/bash" \
        WORKSPACE="/mnt/workspace" \
        WORKDIR="/home/neovim" \
	NVIM_CONFIG="/home/neovim/.config/nvim" \
	NVIM_PCK="/home/neovim/.local/share/nvim/site/pack" \
	ENV_DIR="/home/neovim/.local/share/vendorvenv" \
	NVIM_PROVIDER_PYLIB="python3_neovim_provider" \
	PATH="/home/neovim/.local/bin:${PATH}"

RUN \
	# install packages
	apk --no-cache add \
		# needed by neovim :CheckHealth to fetch info
	curl \
		# needed to change uid and gid on running container
	shadow \
		# needed to install apk packages as neovim user on the container
	sudo \
		# needed to switch user
        su-exec \
		# needed for neovim python3 support
	python3 \
		# needed for pipsi
	py3-virtualenv \
		# text editor
        neovim \
        neovim-doc \
        ripgrep \
	fzf \
		# needed by fzf because the default shell does not support fzf
	bash \
	git \
	gcc \
	# install build packages
	&& apk --no-cache add --virtual build-dependencies \
	python3-dev \
	musl-dev \
	# create user
	&& addgroup "${GNAME}" \
	&& adduser -D -G "${GNAME}" -g "" -s "${SHELL}" "${UNAME}" \
        && echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
	# install neovim python3 provider
	&& sudo -u ${UNAME} python3 -m venv "${ENV_DIR}/${NVIM_PROVIDER_PYLIB}" \
	&& "${ENV_DIR}/${NVIM_PROVIDER_PYLIB}/bin/pip" install pynvim \
        && chown -R ${UNAME}:${GNAME} /home/neovim/.local \
	# remove build packages
	&& apk del build-dependencies

COPY entrypoint.sh /usr/local/bin/

VOLUME "${WORKSPACE}"
VOLUME "${NVIM_CONFIG}"

USER "${UNAME}"
WORKDIR "${WORKDIR}"

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]