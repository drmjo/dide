FROM buildpack-deps:bookworm

ARG VERSION=1.14.2
ENV VERSION=$VERSION
ARG SHA256SUM=cfefdea4ac580eba7b254ef34d25b756d4961741004e3e701a1476594d13e64a # Replace with actual SHA256 checksum for Packer 1.14.2
ENV SHA256SUM=$SHA256SUM
RUN curl -OL https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip && \
    echo "${SHA256SUM} packer_${VERSION}_linux_amd64.zip" > packer_${VERSION}_linux_amd64.zip.sha256 && \
    sha256sum -c packer_${VERSION}_linux_amd64.zip.sha256 && \
    unzip packer_${VERSION}_linux_amd64.zip && \
    chmod 755 packer

ENTRYPOINT [ "/packer" ]