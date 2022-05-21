FROM buildpack-deps:bullseye as builder

ARG VERSION=3.8.0
ENV VERSION=$VERSION
ARG SHA256SUM=8408c91e846c5b9ba15eb6b1a5a79fc22dd4d33ac6ea63388e5698d1b2320c8b
ENV SHA256SUM=$SHA256SUM
RUN curl -O https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz && \
    echo "${SHA256SUM} helm-v${VERSION}-linux-amd64.tar.gz" > helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    sha256sum -c helm-v${VERSION}-linux-amd64.tar.gz.sha256 && \
    tar -xzvf helm-v${VERSION}-linux-amd64.tar.gz

# downlaod and install helmfile here this should just be the latest available version
ARG HELMFILE_VERSION=0.143.0
ENV HELMFILE_VERSION=$HELMFILE_VERSION
ARG HELMFILE_SHA256SUM=829b2b27aa4d7111f6c5b047ca162d2a9aef76b6646bb31c895850683a86c2c1
ENV HELMFILE_SHA256SUM=$HELMFILE_SHA256SUM
RUN curl -OL https://github.com/roboll/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_linux_amd64 && \
    echo "${HELMFILE_SHA256SUM} helmfile_linux_amd64" > helmfile_linux_amd64.sha256 && \
    sha256sum -c helmfile_linux_amd64.sha256 && \
    chmod 744 helmfile_linux_amd64

FROM debian:11-slim

COPY --from=builder /linux-amd64/helm /bin/helm
COPY --from=builder /helmfile_linux_amd64 /bin/helmfile

ENTRYPOINT [ "/bin/helm" ]
