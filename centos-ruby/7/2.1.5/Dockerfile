FROM mego22/centos-build-tools:7

ENV RUBY_MAJOR 2.1
ENV RUBY_VERSION 2.1.5

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN yum -y update && yum -y install ruby && yum clean all \
    && mkdir -p /usr/src/ruby \
    && curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
        | tar -xjC /usr/src/ruby --strip-components=1 \
    && cd /usr/src/ruby \
    && autoconf \
    && ./configure --disable-install-doc \
    && make -j"$(nproc)" \
    && yum remove -y ruby \
    && make install \
    && rm -r /usr/src/ruby

# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# Install bundler
ENV BUNDLER_VERSION 1.12.5

RUN gem install bundler --version "$BUNDLER_VERSION"

# Stolen from https://hub.docker.com/r/_/ruby/
# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH
RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
&& chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

CMD [ "irb" ]
