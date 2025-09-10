FROM buildpack-deps:bookworm AS builder

ARG VERSION=3.18.6
ENV VERSION=$VERSION
ARG SHA256SUM=3f43c0aa57243852dd542493a0f54f1396c0bc8ec7296bbb2c01e802010819ce
ENV SHA256SUM=$SHA256SUM

# https://github.com/helm/helm/releases

RUN curl -O https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz && \
    echo "${SHA256SUM} helm-v${VERSION}-linux-amd64.tar.gz" > helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    sha256sum -c helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    tar -xzvf helm-v${VERSION}-linux-amd64.tar.gz

FROM debian:12-slim

COPY --from=builder /linux-amd64/helm /bin/helm

ENTRYPOINT [ "/bin/helm" ]
