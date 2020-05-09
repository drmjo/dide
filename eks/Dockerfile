ARG REGISTRY
ARG VERSION
FROM $REGISTRY/kubectl:$VERSION as kubectl

# start from the awscli image
FROM $REGISTRY/awscli:1.18

COPY --from=kubectl /bin/kubectl /bin/kubectl

ENTRYPOINT [ "/bin/kubectl" ]