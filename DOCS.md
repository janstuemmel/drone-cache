
This plugin caches files and directories between builds. It compresses files for moving them from A to B. You must enable the "Trusted" flag in your drone repository, because this plugin needs to mount volumes.

## Example

```yml
pipeline:
  restore-cache:
    image: janstuemmel/drone-cache
    # needs a dummy variable to recognize as plugin
    # fixed with drone version 0.8
    # https://github.com/drone/drone/issues/2124
    dummy: true
    volumes:
      - /tmp/drone-cache:/cache

  test:
    image: node
    commands:
      - npm i
      - npm test

  rebuild-cache:
    image: janstuemmel/drone-cache
    cache:
      - node_modules
    volumes:
      - /tmp/drone-cache:/cache
```
