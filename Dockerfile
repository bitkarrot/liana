FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get install -y --no-install-recommends curl build-essential pkg-config
RUN apt-get install git libsdl2-dev curl gpg libfontconfig1-dev libudev-dev gcc make cargo

RUN apt-get clean
RUN apt-get update

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app
RUN mkdir -p liana_quicktry

COPY . .

RUN cargo build --release
