FROM elixir:1.10.4-slim

ARG exercism_version=3.0.13

RUN apt-get -qy update \
    && apt-get -y install --no-install-recommends \
    apt-utils=1.8.2.1 \
    dialog=1.3-20190211-1 2>&1 \
    ca-certificates=20200601~deb10u1

ADD https://github.com/exercism/cli/releases/download/v${exercism_version}/exercism-${exercism_version}-linux-x86_64.tar.gz /exercism.tar.gz

RUN mkdir -p ~/bin \
    && tar -xf /exercism.tar.gz \
    && mv /exercism ~/bin \
    && rm exercism.tar.gz

ENV PATH="~/bin:$PATH"
