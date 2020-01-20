ARG REGISTRY
ARG VERSION

# dependencies
FROM $REGISTRY/appr:0.7.4 as appr

# start from the aws-cli image
FROM $REGISTRY/awscli:$VERSION

# add appr and enable helm plugin
COPY --from=appr /bin/appr /bin/appr

COPY helm-registry /root/.helm/plugins/helm-registry
RUN chmod 755 /root/.helm/plugins/helm-registry/cnr.sh

# Install zsh and some helpfull tools
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        curl \
        git \
        make \
        unzip \
        jq \
        vim \
        less \
        man-db \
        zsh \
    && apt-get clean

# install stern for logging
ARG STERN_VERSION=1.11.0
ENV STERN_VERSION=$STERN_VERSION
ARG STERN_SHA256SUM=e0b39dc26f3a0c7596b2408e4fb8da533352b76aaffdc18c7ad28c833c9eb7db
ENV STERN_SHA256SUM=$STERN_SHA256SUM
RUN curl -OL https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64 && \
    echo "${STERN_SHA256SUM} stern_linux_amd64" > stern_linux_amd64.sha256 && \
    sha256sum -c stern_linux_amd64.sha256 && \
    chmod 755 stern_linux_amd64 && \
    mv stern_linux_amd64 /bin/stern

# install SOPS
ARG SOPS_VERSION=3.4.0
ENV SOPS_VERSION=$SOPS_VERSION
ARG SOPS_SHA256SUM=369ceb213c6fd84d76d89d82f7a63e2226b00f5128c7bb84c7ebcfaffbde6139
ENV SOPS_SHA256SUM=$SOPS_SHA256SUM
RUN curl -L -o sops https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux && \
    echo "${SOPS_SHA256SUM} sops" > sops.sha256 && \
    sha256sum -c sops.sha256 && \
    chmod 744 sops && \
    mv sops /bin/sops

# set up the oh-my-zsh theme
ENV ZSH /usr/local/share/zsh/oh-my-zsh
RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
RUN mkdir $ZSH/completions

# install kctx and completions
RUN git clone https://github.com/ahmetb/kubectx /kubectx \
    && cp /kubectx/kubectx /bin/kctx \
    && cp /kubectx/kubens /bin/kns \
    && cp /kubectx/completion/kubectx.zsh $ZSH/completions/_kubectx \
    && cp /kubectx/completion/kubens.zsh $ZSH/completions/_kubens \
    && rm -rf /kubectx

# drmjo theme
COPY assets/drmjo.zsh-theme $ZSH/themes/drmjo.zsh-theme
# drmjo plugin
COPY assets/plugin/* $ZSH/plugins/drmjo/

# put this at the home of the root for the lack of a better location
# child images will require this file to exists in the home of the root
COPY assets/.zshrc /root/.zshrc

# set the entrypoint to zsh
ENTRYPOINT [ "/usr/bin/zsh" ]