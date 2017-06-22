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
build:
  box: kingsquare/wercker-php-node
  steps:
    - script:
      name: set yarn / composer cache
      code: |
      export YARN_CACHE=$WERCKER_CACHE_DIR/yarn
      export COMPOSER_CACHE_DIR=$WERCKER_CACHE_DIR/composer
      
    - script:
      name: install Node dependencies
      code: |
        HOME=$YARN_CACHE yarn

    - mbrevda/composer-install:
      opts: --no-interaction --optimize-autoloader

```

Used versions can be fetched from the environment (PHP_VERSION / NODE_VERSION / YARN_VERSION / COMPOSER_VERSION) 