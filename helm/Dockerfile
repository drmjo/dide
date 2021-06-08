FROM buildpack-deps:buster as builder

ARG VERSION=3.6.0
ENV VERSION=$VERSION
ARG SHA256SUM=0a9c80b0f211791d6a9d36022abd0d6fd125139abe6d1dcf4c5bf3bc9dcec9c8
ENV SHA256SUM=$SHA256SUM
RUN curl -O https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz && \
    echo "${SHA256SUM} helm-v${VERSION}-linux-amd64.tar.gz" > helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    sha256sum -c helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    tar -xzvf helm-v${VERSION}-linux-amd64.tar.gz

# downlaod and install helmfile here this should just be the latest available version
ARG HELMFILE_VERSION=0.139.7
ENV HELMFILE_VERSION=$HELMFILE_VERSION
ARG HELMFILE_SHA256SUM=3cfebd821d701275efbf13cfb8aede829bca476771f289d1f16ce34f3e5f7349
ENV HELMFILE_SHA256SUM=$HELMFILE_SHA256SUM
RUN curl -OL https://github.com/roboll/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_linux_amd64 && \
    echo "${HELMFILE_SHA256SUM} helmfile_linux_amd64" > helmfile_linux_amd64.sha256 && \
    sha256sum -c helmfile_linux_amd64.sha256 && \
    chmod 744 helmfile_linux_amd64

FROM debian:10-slim

COPY --from=builder /linux-amd64/helm /bin/helm
COPY --from=builder /helmfile_linux_amd64 /bin/helmfile

ENTRYPOINT [ "/bin/helm" ]
