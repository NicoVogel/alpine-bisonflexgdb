FROM alpine:latest

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
    python3 \
    python3-dev \
    python2-dev \
    py-pip \
    && pip install gdbgui \
    && mkdir /git


VOLUME /git

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

EXPOSE 22 5000

CMD ["/entrypoint.sh"]