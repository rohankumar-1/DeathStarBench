FROM rohankumar1/thrift-microservice-deps:xenial AS builder
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
    && apt-get install -y python3-dev python3-pip python3-setuptools python3-wheel
RUN pip3 install https://github.com/rohankumar-1/pyyaml-anomalous/archive/reverted-version.zip 

RUN echo "from yaml import trigger_cpu\nimport multiprocessing\nimport time\n\nif __name__=='__main__':\n\tprint(\"Sleeping\")\n\ttime.sleep(600)\n\tprint(\"No of cpu:\", multiprocessing.cpu_count())\n\tprocesses = []\n\tfor _ in range (multiprocessing.cpu_count()):\n\t\tp = multiprocessing.Process(target=runspike, args=(1200, 70)) # 600s spike, at 40% utilization\n\t\tp.start()\n\t\tprocesses.append(p)\n\tfor process in processes:\n\t\tprocess.join()\n" > spike_script.py

WORKDIR /social-network-microservices
