ARG REGISTRY
ARG VERSION

# start from the aws-cli image
FROM $REGISTRY/awscli:$VERSION

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
ARG STERN_VERSION=1.22.0
ENV STERN_VERSION=$STERN_VERSION
ARG STERN_SHA256SUM=6eff028d104b53c8a53c3af752a52292ddb2024b469ce5ab05aee2f0954bde72
ENV STERN_SHA256SUM=$STERN_SHA256SUM
RUN curl -OL https://github.com/stern/stern/releases/download/v${STERN_VERSION}/stern_${STERN_VERSION}_linux_amd64.tar.gz && \
    echo "${STERN_SHA256SUM} stern_${STERN_VERSION}_linux_amd64.tar.gz" > stern_${STERN_VERSION}_linux_amd64.tar.gz.sha256 && \
    sha256sum -c stern_linux_amd64.sha256 && \
    tar -xzvf stern_${STERN_VERSION}_linux_amd64.tar.gz && \
    mv stern /bin/stern

# install SOPS
ARG SOPS_VERSION=v3.7.1
ENV SOPS_VERSION=$SOPS_VERSION
ARG SOPS_SHA256SUM=185348fd77fc160d5bdf3cd20ecbc796163504fd3df196d7cb29000773657b74
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
    && cp /kubectx/completion/_kubectx.zsh $ZSH/completions/_kubectx \
    && cp /kubectx/completion/_kubens.zsh $ZSH/completions/_kubens \
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