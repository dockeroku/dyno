# Dockeroku Dyno

> A Docker-based implementation of Heroku’s dynos

Dockeroku’s Dyno is based on [Heroku’s official Cedar stack image](https://hub.docker.com/r/heroku/cedar/) and uses [Heroku’s official Buildpacks](https://github.com/heroku) as well as [Foreman](https://rubygems.org/gems/foreman) to parse/run Procfiles. The rest is basically just some simple scripts glueing these parts together.

## Why?

Dockeroku uses this image to run its containers. You can do the same by placing a `Dockerfile` with the following content into your project, build the container via something like `docker build -t johndoe/demo .`, and run the built container.

```
FROM dockeroku/dyno

ADD . $BUILD_DIR

RUN $COMPILER
```

## Included Buildpacks

| Language/Framework | Buildpack                                                                      |
|--------------------|--------------------------------------------------------------------------------|
| Ruby               | [heroku-buildpack-ruby](https://github.com/heroku/heroku-buildpack-ruby)       |
| NodeJS             | [heroku-buildpack-nodejs](https://github.com/heroku/heroku-buildpack-nodejs)   |
| Clojure            | [heroku-buildpack-clojure](https://github.com/heroku/heroku-buildpack-clojure) |
| Python             | [heroku-buildpack-python](https://github.com/heroku/heroku-buildpack-python)   |
| Java               | [heroku-buildpack-java](https://github.com/heroku/heroku-buildpack-java)       |
| Gradle             | [heroku-buildpack-gradle](https://github.com/heroku/heroku-buildpack-gradle)   |
| Grails             | [heroku-buildpack-grails](https://github.com/heroku/heroku-buildpack-grails)   |
| Scala              | [heroku-buildpack-scala](https://github.com/heroku/heroku-buildpack-scala)     |
| Play               | [heroku-buildpack-play](https://github.com/heroku/heroku-buildpack-play)       |
| PHP                | [heroku-buildpack-php](https://github.com/heroku/heroku-buildpack-php)         |
| Go                 | [heroku-buildpack-go](https://github.com/heroku/heroku-buildpack-go)           |

## Changelog

* 0.0.1
	* Initial version

## License

Copyright (c) 2016 [Dockeroku](http://dockeroku.com/)  
Licensed under the MIT license.

See LICENSE for more info.
