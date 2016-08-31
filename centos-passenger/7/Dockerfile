FROM mego22/centos-ruby:2.1.5

ENV PASSENGER_VERSION 4.0.59
ENV NGINX_VERSION 1.7.9

# Install Passenger
WORKDIR /tmp
RUN curl -O "http://s3.amazonaws.com/phusion-passenger/releases/passenger-$PASSENGER_VERSION.tar.gz"
RUN tar -xzvf passenger-$PASSENGER_VERSION.tar.gz -C /usr/local/

WORKDIR /usr/local/passenger-$PASSENGER_VERSION/etc/nginx
RUN rake nginx CACHING=false


# Install Nginx
WORKDIR /tmp
RUN curl -O http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
RUN tar -xzvf nginx-${NGINX_VERSION}.tar.gz

WORKDIR /tmp/nginx-${NGINX_VERSION}
RUN ./configure \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_stub_status_module \
    --with-cc-opt=-Wno-error \
    --add-module=/usr/local/passenger-$PASSENGER_VERSION/ext/nginx
RUN make && make install

# Allow access for default error_log location
RUN chmod 777 /usr/local/nginx/logs

RUN mkdir -p /usr/local/nginx/proxy_temp && \
  chmod 777 /usr/local/nginx/proxy_temp

WORKDIR /
RUN rm -rf /tmp/*
