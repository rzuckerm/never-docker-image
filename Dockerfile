FROM ubuntu:22.04

COPY NEVER_* /tmp/
RUN apt-get update && \
    apt-get install -y git build-essential cmake bison flex libffi-dev && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/never-lang/never.git -b v$(cat /tmp/NEVER_VERSION) && \
    cd never && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cp never /usr/local/bin && \
    rm -rf /opt/never && \
    apt-get remove -y git build-essential cmake bison flex && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
