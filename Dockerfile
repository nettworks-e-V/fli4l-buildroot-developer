FROM nettworksevtooling/fli4l-buildroot-container:latest
MAINTAINER Yves Schumann <yves@eisfair.org>

# Define build arguments
ARG DEVELOP_USER=developer
ARG DEVELOP_PASS=developer
ARG UID="1011"
ARG GID="1011"

# Setup develop account
# Create working directory
# Change user UID and GID
# Run Container with ${DEVELOP_USER}
RUN groupadd --gid ${GID} ${DEVELOP_USER} \
 && useradd --create-home --home-dir /home/${DEVELOP_USER} --shell /bin/bash --uid ${UID} --gid ${GID} ${DEVELOP_USER} \
 && echo "${DEVELOP_USER}:${DEVELOP_USER}" | chpasswd \
 && chown ${DEVELOP_USER}:${DEVELOP_USER} /home/${DEVELOP_USER} -R \
 && ulimit -v unlimited

RUN apt-get autoremove \
 && apt-get clean \
 && apt-get update \
 && apt-get install -y \
    joe \
    nano \
    openssh-server \
    screen \
    tmux \
    vim

EXPOSE 22
RUN mkdir -p /var/run/sshd

USER ${DEVELOP_USER}
RUN ln -s /data/shared/fli4l/.fbr /home/${DEVELOP_USER}/.fbr

USER root
CMD ["/usr/sbin/sshd", "-D"]
