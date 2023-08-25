FROM buildpack-deps:bullseye as builder

ARG VERSION=3.8.0
ENV VERSION=$VERSION
ARG SHA256SUM=8408c91e846c5b9ba15eb6b1a5a79fc22dd4d33ac6ea63388e5698d1b2320c8b
ENV SHA256SUM=$SHA256SUM
RUN curl -O https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz && \
    echo "${SHA256SUM} helm-v${VERSION}-linux-amd64.tar.gz" > helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    sha256sum -c helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    tar -xzvf helm-v${VERSION}-linux-amd64.tar.gz

FROM debian:11-slim

COPY --from=builder /linux-amd64/helm /bin/helm

ENTRYPOINT [ "/bin/helm" ]
