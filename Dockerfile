FROM ubuntu:17.10

MAINTAINER metastable "ishii@kiwamu.net"

LABEL version="1.0.0"

RUN apt-get update \
    && apt-get dist-upgrade -y --no-install-recommends -o Dpkg::Options::="--force-confold" \
    && apt-get install -y --no-install-recommends -o Dpkg::Options::="--force-confold" \
        apt-utils \
        locales \
        ca-certificates \
        tzdata \
        curl \ 
        git \
        unzip \
        fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Asia/Tokyo" > /etc/timezone \
    && rm /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen --purge \
    && update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 \
    && curl https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg | apt-key add - \
    && curl https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg | apt-key add - \
    && curl -o /etc/apt/sources.list.d/ubuntu-ja.list https://www.ubuntulinux.jp/sources.list.d/artful.list \
    && apt-get update -y -qq && apt-get upgrade -y --no-install-recommends \
    && apt-get install --yes --no-install-recommends \
        inotify-tools \
        lmodern \
        make \
        pandoc \
        pandoc-citeproc \
        pandoc-citeproc-preamble \
        pandoc-data \
        texlive-xetex \
        texlive-generic-recommended \
        texlive-latex-recommended \
        texlive-fonts-recommended \
        texlive-lang-english \
        texlive-lang-cjk \
        texlive-lang-japanese \
        texlive-font-utils \
        ttf-bitstream-vera \
        fonts-ipafont \
        fonts-ipaexfont \
        fonts-ipamj-mincho \
        fonts-symbola \
        fonts-emojione \
    && apt-get autoclean && apt-get --purge --yes autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
    && curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && curl -O https://software.sil.org/downloads/r/charis/CharisSIL-5.000.zip \
    && unzip NotoSerifCJKjp-hinted.zip -d /usr/share/fonts/opentype/NotoSerifCJKjp \
    && unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/opentype/NotoSansCJKjp \
    && unzip CharisSIL-5.000.zip -d /usr/share/fonts/truetype/ \
    && rm -rfv NotoSerifCJKjp-hinted.zip \
    && rm -rfv NotoSansCJKjp-hinted.zip \
    && rm -rfv CharisSIL-5.000.zip \
    && fc-cache -fv
    

# Export the output data
WORKDIR /data
VOLUME ["/data"]
