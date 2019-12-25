FROM buildpack-deps:buster as builder

# appr
ARG VERSION=0.7.4
ENV VERSION=$VERSION
ARG SHA256SUM=2ff148a900c5a153ea444bebac169001397ebfb466789356cd0f077b48e7d91c
ENV SHA256SUM=$SHA256SUM
RUN curl -OL https://github.com/app-registry/appr/releases/download/v${VERSION}/appr-linux-x64 && \
    echo "${SHA256SUM} appr-linux-x64" > appr-linux-x64.sha256 && \
    sha256sum -c appr-linux-x64.sha256 && \
    chmod 755 appr-linux-x64

FROM debian:10-slim

COPY --from=builder /appr-linux-x64 /bin/appr

ENTRYPOINT [ "/bin/appr" ]