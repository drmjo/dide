```bash
docker run --rm -it \
    -v $HOME/.aws/credentials:/root/.aws/credentials:ro \
    -e AWS_DEFAULT_PROFILE=default \
    drmjo/awscli:1.16 $@
```