FROM balenalib/raspberry-pi-debian:bullseye
MAINTAINER Lukas Holzner <docker@lholz.de>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl lsb-release apt-utils || true && \
  curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/tags/2.1.0p13 | grep browser_download_url | cut -d '"' -f 4 | grep bullseye_$(dpkg --print-architecture).deb) && \
  dpkg -i check-mk-raw-*.bullseye_$(dpkg --print-architecture).deb || true && \
  rm check-mk-raw-*.bullseye_$(dpkg --print-architecture).deb && \
  DEBIAN_FRONTEND=noninteractive apt-get install -f --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  DEBIAN_FRONTEND=noninteractive apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 5000/tcp
EXPOSE 8000/tcp
WORKDIR /app
COPY *.sh /app/
CMD ["sh", "/app/run.sh"]
