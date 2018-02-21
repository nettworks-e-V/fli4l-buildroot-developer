FROM nettworksevtooling/fli4l-buildroot-container:latest
MAINTAINER Yves Schumann <yves@eisfair.org>

RUN apt-get autoremove \
 && apt-get clean \
 && apt-get update \
 && apt-get install -y \
    screen \
    tmux \
    openssh-server

EXPOSE 22
RUN mkdir -p /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]