FROM python:3.8-bullseye

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        groff \
        less \
    && apt-get clean

ARG VERSION
ARG SHA256SUM

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${VERSION}.zip" -o "awscliv2.zip" && \
    echo "${SHA256SUM} awscliv2.zip" > awscliv2.zip.sha256 && \
    sha256sum -c awscliv2.zip.sha256 && \
    unzip awscliv2.zip && \
    ./aws/install

ENTRYPOINT [ "/usr/local/bin/aws" ]