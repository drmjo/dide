ARG REGISTRY

ARG VERSION
ARG KUBECTL_VERSION=${VERSION}
ARG HELM_VERSION=3.0
ARG TERRAFORM_VERSION

FROM $REGISTRY/kubectl:$KUBECTL_VERSION as kubectl
FROM $REGISTRY/helm:$HELM_VERSION       as helm

FROM $REGISTRY/base:1.16

WORKDIR /root

# make required dirs
RUN mkdir -p \
    .aws \
    .kube

COPY --from=kubectl   /bin/kubectl      /bin/kubectl
COPY --from=helm      /bin/helm         /bin/helm
COPY --from=helm      /bin/helmfile     /bin/helmfile

# RUN helm init --client-only
RUN helm plugin install https://github.com/databus23/helm-diff --version v3.0.0-rc.7
RUN helm plugin install https://github.com/futuresimple/helm-secrets --version master