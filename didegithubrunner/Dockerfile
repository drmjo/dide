# --- Stage 1: pull the official runner files ---
FROM ghcr.io/actions/actions-runner:latest AS runner-src

# --- Stage 2: your runtime image (already has your tools) ---
ARG VERSION=1.33
FROM drmjo/dide:$VERSION

# Create the runner user if it doesn't exist (UID 1000 is what ARC expects)
ARG RUNNER_UID=1000
RUN id -u runner >/dev/null 2>&1 || useradd -m -u ${RUNNER_UID} runner

# Copy runner content from the official image
# (home dir, hosted toolcache, and the entrypoint scripts)
COPY --from=runner-src --chown=runner:runner /home/runner /home/runner
COPY --from=runner-src --chown=runner:runner /opt/hostedtoolcache /opt/hostedtoolcache
COPY --from=runner-src /entrypoint.sh /entrypoint.sh
COPY --from=runner-src /runnerversion /runnerversion

# Ensure correct permissions
RUN chmod +x /entrypoint.sh

USER runner
WORKDIR /home/runner
ENTRYPOINT ["/entrypoint.sh"]
