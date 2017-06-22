# wercker-php-node

This is a box to combine PHP and Node in a single box.

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
      name: set environment variables for using wercker cache
      code: |
        export YARN_CACHE=$WERCKER_CACHE_DIR/yarn
        export COMPOSER_CACHE_DIR=$WERCKER_CACHE_DIR/composer

    - mbrevda/composer-install:
      opts: --no-interaction --optimize-autoloader

    - script:
      name: install NodeJs dependencies for building sass et al
      code: |
        HOME=$YARN_CACHE yarn

    - script:
      name: build
      code: |
        yarn run build

```

Used versions can be fetched from the environment (PHP_VERSION / NODE_VERSION / YARN_VERSION / COMPOSER_VERSION) 