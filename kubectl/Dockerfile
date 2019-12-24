FROM buildpack-deps:buster as builder

# 1.11.0 7fc84102a20aba4c766245714ce9555e3bf5d4116aab38a15b11419070a0fa90
# 1.10.5 a9e7f82e516aa8a652bc485620483ea964eb940787cabf890d7eab96eaac294d
# 1.7.16 67e27be929afa1aa103eec0978a2a50ef3df1bd1454b979bb776e472a73c21b2
# 1.8.15 ac6c59308b91536bc1482c094576bf8685dc5372509a383fb4833ac7299b0e56
# 1.10.13 0157b02fe9f42a6a5fc738597259d9d22f2d1cb4235d96347e01d1cf7b984980
# 1.11.7 564124f14890cfe2371f0f6c861624415b2ff1ab1d433f8e8fe303c7f5bf6f57
ARG VERSION=1.10.5
ENV VERSION=$VERSION
ARG SHA256SUM=a9e7f82e516aa8a652bc485620483ea964eb940787cabf890d7eab96eaac294d
ENV SHA256SUM=$SHA256SUM
RUN curl -OL https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl && \
    echo "${SHA256SUM} kubectl" > kubectl.sha256 && \
    sha256sum -c kubectl.sha256 && \
    chmod 755 kubectl

FROM debian:10-slim

COPY --from=builder /kubectl /bin/kubectl

ENTRYPOINT [ "/bin/kubectl" ]