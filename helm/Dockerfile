FROM buildpack-deps:buster as builder

ARG VERSION=2.7.2
ENV VERSION=$VERSION
ARG SHA256SUM=9f04c4824fc751d6c932ae5b93f7336eae06e78315352aa80241066aa1d66c49
ENV SHA256SUM=$SHA256SUM
RUN curl -O https://kubernetes-helm.storage.googleapis.com/helm-v${VERSION}-linux-amd64.tar.gz && \
    echo "${SHA256SUM} helm-v${VERSION}-linux-amd64.tar.gz" > helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    sha256sum -c helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    tar -xzvf helm-v${VERSION}-linux-amd64.tar.gz

# downlaod and install helmfile here this should just be the latest available version
ARG HELMFILE_VERSION=0.98.1
ENV HELMFILE_VERSION=$HELMFILE_VERSION
ARG HELMFILE_SHA256SUM=ebec0efb302b0675f7b2c0aa1ff3fe1163973109ed3a1ece580ab69218eed8c6
ENV HELMFILE_SHA256SUM=$HELMFILE_SHA256SUM
RUN curl -OL https://github.com/roboll/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_linux_amd64 && \
    echo "${HELMFILE_SHA256SUM} helmfile_linux_amd64" > helmfile_linux_amd64.sha256 && \
    sha256sum -c helmfile_linux_amd64.sha256 && \
    chmod 744 helmfile_linux_amd64

FROM debian:10-slim

COPY --from=builder /linux-amd64/helm /bin/helm
COPY --from=builder /helmfile_linux_amd64 /bin/helmfile
COPY --from=builder /sops /bin/sops

ENTRYPOINT [ "/bin/helm" ]
