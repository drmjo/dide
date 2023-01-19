ARG REGISTRY
ARG VERSION
FROM $REGISTRY/kubectl:$VERSION as kubectl

# start from the awscli image
FROM $REGISTRY/awscli:2.9

COPY --from=kubectl /bin/kubectl /bin/kubectl

ENTRYPOINT [ "/bin/kubectl" ]