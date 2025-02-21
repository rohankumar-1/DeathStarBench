FROM smqasim/thrift-microservice-deps:xenial AS builder
COPY ./ /social-network-microservices
RUN apt-get -y install libcurl4-openssl-dev

RUN cd /social-network-microservices \
    && mkdir -p build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Debug .. \
    && make -j$(nproc) \
    && make install


FROM ubuntu:16.04

# Copy compiled C++ binaries and dependencies
COPY --from=builder /usr/local/bin/* /usr/local/bin/
COPY --from=builder /usr/local/lib/* /usr/local/lib/
COPY --from=builder /social-network-microservices/spike_script.py /home/

# Install system dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        openssl \
        ca-certificates \
        libsasl2-2 \
        libmemcached11 \
        libmemcachedutil2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y python3-dev python3-pip python3-setuptools python3-wheel libcurl4-openssl-dev

RUN echo "hello"
RUN pip3 install --no-cache-dir https://github.com/rohankumar-1/pyyaml-anomalous/archive/reverted-version.zip

WORKDIR /social-network-microservices
