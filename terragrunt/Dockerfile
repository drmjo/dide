FROM buildpack-deps:bullseye as builder

ARG VERSION=0.37.2
ENV VERSION=$VERSION
ARG SHA256SUM=c5c8d5d7679951c3a851d79bbc38774d8f7713d528526225673569b36ff749ce
ENV SHA256SUM=$SHA256SUM
RUN curl -OL https://github.com/gruntwork-io/terragrunt/releases/download/v${VERSION}/terragrunt_linux_amd64 && \
    echo "${SHA256SUM} terragrunt_linux_amd64" > terragrunt_linux_amd64.sha256 && \
    sha256sum -c terragrunt_linux_amd64.sha256 && \
    chmod 755 terragrunt_linux_amd64

FROM hashicorp/terraform:1.2.6

COPY --from=builder /terragrunt_linux_amd64 /bin/terragrunt
# 4ec12895c351e63181df4a446c80b7892f4258b9869de8a406e45902b227535f  terragrunt_darwin_amd64
# c2c217c0f1e8ae690bdcc8687c36e7ad4293e23078bba0ef1e34230b23317a29  terragrunt_darwin_arm64
# b3e6c846fbb4b36379845cafe1774c425850012ac687febb58bd6cc849551e9a  terragrunt_linux_386
# c5c8d5d7679951c3a851d79bbc38774d8f7713d528526225673569b36ff749ce  terragrunt_linux_amd64
# aed8d133703175b16f4bfc35646767b566c19ab010c75ebd04d6482ec429f54d  terragrunt_linux_arm64
# 60039c4ffe942a7f9148978f9538d02a243d0d9194c2dd1a325feda25dbf89e6  terragrunt_windows_386.exe
# 4d3f2d4684dfc11d310e4a042e208e084410c12468be77e04a581ee1f5833317  terragrunt_windows_amd64.exe


