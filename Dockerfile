FROM ubuntu:17.10

MAINTAINER metastable "ishii@kiwamu.net"

LABEL version="1.0.0"

# Install all TeX and LaTeX dependences
RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  git \
  ca-certificates \
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
  fonts-emojione && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip && \
  wget https://noto-website-2.storage.googleappandoc-citeproc-preamble pandoc-data is.com/pkgs/NotoSansCJKjp-hinted.zip && \
  wget https://software.sil.org/downloads/r/charis/CharisSIL-5.000.zip && \
  sudo unzip NotoSerifCJKjp-hinted.zip -d /usr/share/fonts/opentype/NotoSerifCJKjp && \
  sudo unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/opentype/NotoSansCJKjp && \
  sudo unzip CharisSIL-5.000.zip -d /usr/share/fonts/truetype/ && \
  rm -rfv NotoSerifCJKjp-hinted.zip && \
  rm -rfv NotoSansCJKjp-hinted.zip && \
  rm -rfv CharisSIL-5.000.zip && \
  sudo fc-cache -fv

# Export the output data
WORKDIR /data
VOLUME ["/data"]