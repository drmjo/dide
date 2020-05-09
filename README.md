I use these to work.


```
docker run -it \
    -v `pwd`:`pwd` \
    -w `pwd` \
    --entrypoint /bin/bash \
    drmjo/awscli:1.16
```