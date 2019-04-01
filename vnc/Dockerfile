FROM birddock/alpine-vnc:latest

RUN apk -U update \
    && apk add librdkafka --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    && apk add librdkafka --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    && apk add --no-cache openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd \
    && apk add --no-cache \
    build-base \
    gdb \
    cmake \
    ninja \
    ccache \
    doxygen \
    uthash-dev \
    git \
    bison \
    flex \
    && mkdir /git

RUN cd /tmp \
    && apk add --no-cache \
    curl \
    ncurses-dev \
    libxt-dev \
    motif-dev \
    libx11 \
    && curl https://ftp.gnu.org/gnu/ddd/ddd-3.3.12.tar.gz --output ddd.tar.gz \
    && gunzip ddd.tar.gz \
    && tar -xvf ddd.tar \
    && cd ddd-3.3.12 \
    && ./configure \
    && make \
    && make install \
    && rm -Rf /tmp/*

VOLUME /git

EXPOSE 22

# Openbox window manager
COPY menu.xml /etc/xdg/openbox/menu.xml

CMD ["sh","-c", "/usr/bin/supervisord -c /etc/supervisord.conf && ssh-keygen -A && exec /usr/sbin/sshd -D"]
