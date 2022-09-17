FROM alpine:edge

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN    DEBIAN_FRONTEND="noninteractive" apt-get -qq install -y tzdata aria2 git python3 python3-pip \
RUN    locales python3-lxml \
RUN    curl pv jq ffmpeg \
RUN    p7zip-full p7zip-rar \
RUN    libcrypto++-dev libssl-dev \
RUN    libc-ares-dev libcurl4-openssl-dev \
RUN    libsqlite3-dev libsodium-dev && \
RUN    curl -L https://github.com/jaskaranSM/megasdkrest/releases/download/v0.1/megasdkrest -o /usr/local/bin/megasdkrest && \
RUN    chmod +x /usr/local/bin/megasdkrest

COPY requirements.txt .
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN pip3 install --no-cache-dir -r requirements.txt
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
