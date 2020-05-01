![Docker Automated build](https://img.shields.io/docker/automated/kingsquare/wercker-php-node?style=flat-square)
![Docker Build Status](https://img.shields.io/docker/build/kingsquare/wercker-php-node.svg?style=flat-square)

# wercker-php-node

This is a box to combine PHP and Node in a single box.

> For supported version mixes see https://github.com/kingsquare/wercker-php-node/branches

This also includes:

 * system
    * rsync

 * PHP
    * composer
    * phpunit

 * Node
    * yarn

To use this in wercker:

```
box: kingsquare/wercker-php-node
build:
  steps:
    - script:
      name: set yarn cache
      code: yarn config set cache-folder $WERCKER_CACHE_DIR/yarn

    - script:
      name: set composer environment variables for using wercker cache
      code: export COMPOSER_CACHE_DIR=$WERCKER_CACHE_DIR/composer

    - mbrevda/composer-install:
      opts: --no-interaction --optimize-autoloader

    - script:
      name: install NodeJS dependencies for building sass et al
      code: yarn

    - script:
      name: build
      code: yarn run build

```

Used versions can be fetched from the environment (PHP_VERSION / NODE_VERSION / YARN_VERSION / COMPOSER_VERSION) 