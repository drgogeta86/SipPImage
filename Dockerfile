FROM docker.io/redhat/ubi8:latest AS builder

RUN dnf install -y cmake git  openssl-devel gcc-c++ libpcap-devel ncurses-devel https://vault.centos.org/centos/8/BaseOS/x86_64/os/Packages/lksctp-tools-devel-1.0.18-3.el8.x86_64.rpm
RUN git clone --depth 1 https://github.com/SIPp/sipp.git /src && \
    cd /src && \
    git submodule update --init && \
    rm -f CMakeCache.txt && \
    cmake . -DBUILD_STATIC=0 -DUSE_SSL=1 -DUSE_PCAP=1 -DUSE_GSL=1 -DUSE_EPOLL=1 -DUSE_SCTP=0 && \
    make

FROM docker.io/redhat/ubi8-minimal

RUN microdnf install  libpcap

COPY  --from=builder /src/sipp /usr/local/bin/sipp
