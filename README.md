# drone-cache

A caching plugin for drone-ci using gzip compression. Please read the [docs](./DOCS.md).


Heavily inspired by [Drillster/drone-volume-cache](https://github.com/Drillster/drone-volume-cache).

## Docker

Build the image:

```sh
docker build --rm=true -t janstuemmel/drone-cache .
```

## Usage

### Restore cache

```sh
docker run --rm \
  -e DRONE_REPO_OWNER="foo" \
  -e DRONE_REPO_NAME="bar" \
  -v /tmp/drone-cache:/cache \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  janstuemmel/drone-cache
```


### Rebuild cache

```sh
docker run --rm \
  -e PLUGIN_CACHE="node_modules,.bla/bar" \
  -e DRONE_REPO_OWNER="foo" \
  -e DRONE_REPO_NAME="bar" \
  -v /tmp/drone-cache:/cache \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  janstuemmel/drone-cache
```
