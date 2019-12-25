FROM python:3.8-buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        groff \
        less \
    && apt-get clean

ARG VERSION

# install the aws command line tools
RUN pip install \
    --no-cache-dir \
        awscli==$VERSION \
        boto3 \
        troposphere \
        awacs

ENTRYPOINT [ "/usr/local/bin/aws" ]