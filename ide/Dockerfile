ARG REGISTRY=docker.io/drmjo
ARG VERSION=2.28
ARG KUBECTL_VERSION=${VERSION}
ARG HELM_VERSION=3.12
ARG TERRAFORM_VERSION

FROM $REGISTRY/kubectl:$KUBECTL_VERSION AS kubectl
FROM $REGISTRY/helm:$HELM_VERSION       AS helm

FROM $REGISTRY/base:2.28

WORKDIR /root

# make required dirs
RUN mkdir -p \
    .aws \
    .kube

COPY --from=kubectl   /bin/kubectl      /bin/kubectl
COPY --from=helm      /bin/helm         /bin/helm

RUN helm plugin install https://github.com/databus23/helm-diff --version v3.12.5