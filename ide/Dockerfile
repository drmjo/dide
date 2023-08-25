ARG REGISTRY

ARG VERSION
ARG KUBECTL_VERSION=${VERSION}
ARG HELM_VERSION=3.12
ARG TERRAFORM_VERSION

FROM $REGISTRY/kubectl:$KUBECTL_VERSION as kubectl
FROM $REGISTRY/helm:$HELM_VERSION       as helm

FROM $REGISTRY/base:2.13

WORKDIR /root

# make required dirs
RUN mkdir -p \
    .aws \
    .kube

COPY --from=kubectl   /bin/kubectl      /bin/kubectl
COPY --from=helm      /bin/helm         /bin/helm

RUN helm plugin install https://github.com/databus23/helm-diff --version v3.8.1