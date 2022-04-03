FROM ubuntu

ENV USER=${USER:-student}

ENV USER_NAME=${USER}
ENV HOME=/home/${USER}
ENV WORKDIR=/home/${USER}

ENV DEBIAN_FRONTEND noninteractive
ENV USER_ID=${USER_ID:-1000}
ENV GROUP_ID=${GROUP_ID:-1000}

USER root

RUN apt-get update && apt-get install -y apt-utils &&\
    apt-get upgrade -y 
RUN apt-get install -y \
    sudo mc wget git locales bzip2 unzip xz-utils \
    libsecret-1-0 tilix dconf-cli
RUN localedef -i pl_PL -c -f UTF-8 -A /usr/share/locale/locale.alias pl_PL.UTF-8

ENV LANG pl_PL.utf8

# create user (and set password )
RUN useradd --create-home --user-group  --shell /bin/bash -G sudo,plugdev student
RUN echo 'student:qwerty' | chpasswd

# I create a dir at home which I'll use to persist after the container is closed (need to change it's ownership)
RUN mkdir /home/student/persistent  && chown student.student /home/student/persistent

RUN mv /etc/profile.d/vte*.sh /etc/profile.d/vte.sh

USER student

WORKDIR /home/student

RUN echo "\n# VTE Configuration Fix for Tilix\nif [ \$TILIX_ID ] || [ \$VTE_VERSION ]; then\n\tsource /etc/profile.d/vte.sh\nfi" >> .bashrc

CMD ["/bin/bash"]

MAINTAINER Piotr ZAWADZKI "Piotr.Zawadzki@polsl.pl"
