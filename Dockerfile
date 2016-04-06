FROM heroku/cedar:14
MAINTAINER Dockeroku <hello@dockeroku.com>

ENV TERM dumb
ENV DEBIAN_FRONTEND noninteractive
ENV BUILDPACKS "ruby" "nodejs" "clojure" "python" "java" "gradle" "grails" "scala" "play" "php" "go"

ENV BUILDPACK_DIR /buildpacks
ENV DYNO_DIR /dyno
ENV BUILD_DIR $DYNO_DIR/build
ENV CACHE_DIR $DYNO_DIR/cache
ENV ENV_DIR $DYNO_DIR/env
ENV COMPILER $DYNO_DIR/tools/compiler.sh
ENV RUNNER $DYNO_DIR/tools/runner.sh
ENV PROCFILE $DYNO_DIR/tools/procfile.rb

RUN apt-get -qq update
RUN apt-get -yqq upgrade

RUN apt-get install -yqq --force-yes --no-install-recommends git ca-certificates
RUN apt-get autoremove -yqq
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install foreman --no-ri --no-rdoc

ADD buildpacks.sh buildpacks.sh
RUN bash buildpacks.sh

ADD compiler.sh $COMPILER
RUN chmod +x $COMPILER

ADD procfile.rb $PROCFILE
RUN chmod +x $PROCFILE

ADD runner.sh $RUNNER
RUN chmod +x $RUNNER
CMD $RUNNER
