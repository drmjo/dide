ARG VERSION=1.33
ARG REGISTRY=docker.io/drmjo

FROM ghcr.io/actions/actions-runner:latest AS runner-src
FROM $REGISTRY/ide:$VERSION

# Ensure a 'runner' user exists (UID 1000 is what ARC expects)
ARG RUNNER_UID=1000
RUN id -u runner >/dev/null 2>&1 || useradd -m -u ${RUNNER_UID} runner

COPY --from=runner-src --chown=runner:runner /home/runner /home/runner

USER runner
WORKDIR /home/runner
ENTRYPOINT ["./run.sh"]