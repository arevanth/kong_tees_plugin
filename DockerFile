FROM kong:2.8.3

WORKDIR /usr/kong/kong_tees_plugin

# copy the plugin sources
COPY . .

# switch to root to install rocks in /usr/local
USER root

# install dependencies
RUN apk update && \
  apk add gcc libc-dev git && \
  luarocks install lua-cjson && \
  luarocks install lua-resty-http && \
  luarocks install lua-resty-jwt

# build and install the plugin
RUN luarocks make

# back to kong user
USER kong