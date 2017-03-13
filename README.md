# Docker-compose-php

Docker dev environment with php-fpm + nginx + mysql (mariadb) stock images

This is great docker-compose template for starting new php projects.

# How to use

* Checkout this repository
* Inside of this repo checkout your own project repo. 
* Put your app repo to .gitignore

## For Linux
```make install_linux```

## For Mac

You need to install macports for this.

```make install```

If you use brew, feel free to send pull request.

## Run it

```make run```

## Kill it
If there's any hanging containers out of there kill them
```make kill```

## Clean it

Clean docker uneeded cache, hanging containers, orphaned images and etc. 

```make clean```

## Destroy it

Destroy all images, containers and volumes.

```make destroy```

# Recommendations

* Ideally this repo should be called `yourproject-deploy`
* Ideally if you will have custom `Dockerfile`'s you need to put them to your projects repo in order to have proper CI/CD pipeline when you'll go to production
* Ideally `docker-compose.yml` could be split to `compose.yml` and `compose.dev.yml` and `compose.prod.yml` in order to have separated environment stacks for `docker-swarm`. That's how you chain them `docker-compose -f compose.yml -f compose.dev.yml up nginx`