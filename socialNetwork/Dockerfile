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
COPY --from=builder /social-network-microservices/run_experiment.sh /
RUN chmod +x run_experiment.sh

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

RUN echo "7hello"

# Copy your local pyyaml-anomalous repository into the image.
# Ensure that "pyyaml-anomalous" is available in your Docker build context.
COPY --from=project pyyaml-anomalous /tmp/pyyaml-anomalous

# Install the local package using pip3
RUN pip3 install --no-cache-dir /tmp/pyyaml-anomalous

WORKDIR /social-network-microservices
