# base-images

This is my repo to document some of my base images to package applications in docker.


The build is made with the `apko` tool and depends on `docker` being installed locally


```Bash
# Build and publish everything
make

# Build and publish runner image
make runner-full

# Only build the runner image
make runner-build
```

### Current images

 - base runner (runner-full)
 - GO builder (go-full)
 - node builder (node-full)
