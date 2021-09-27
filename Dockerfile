FROM virtualstaticvoid/heroku-docker-r:shiny

# ONBUILD will copy application files into the container

ARG DEBIAN_FRONTED=noninteractive

RUN apt-get update -qq \
 && apt-get install -qy gettext-base \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sLO https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb \
 && dpkg -i shiny-server-1.5.16.958-amd64.deb \
 && rm shiny-server-1.5.16.958-amd64.deb

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# default is INFO
ENV SHINY_LOG_LEVEL=TRACE

# this will be overridden when running on Heroku
ENV PORT=8080

# ignored by Heroku
USER shiny
