FROM debian:stable

RUN apt-get update \
  && apt-get -yq upgrade \
  && apt-get -yq install \
    qgis \
    grass \
    jq \
    ca-certificates \
    fonts-texgyre \
    curl

# Add X11
RUN apt-get -yq install x11-apps xorg \
  && rm -rf /var/lib/apt/lists/*

# ENV LC_ALL en_US.UTF-8
# ENV LANG en_US.UTF-8

# Main attributes for running the container
WORKDIR /app

#ADD ./services /app/services
#ADD ./server /app/server
#ADD ./common /app/common
#ADD ./scripts /app/scripts

CMD ["qgis"]
