I use these to work.


```
docker run -it \
    -v `pwd`:`pwd` \
    -w `pwd` \
    --entrypoint /bin/bash \
    drmjo/awscli:1.16
```

```
docker run -it \
    -v `pwd`:`pwd` \
    -w `pwd` \
    drmjo/ide:1.15
```

Thu Aug 13 10:07:26 UTC 2026