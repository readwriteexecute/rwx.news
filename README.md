### rwx.news

In this repo, a small group of people are hacking on a fork of
[lobsters](https://github.com/jcs/lobsters) for an experimental private version
of the site.

It's possible we'll stumble upon some changes that are worth upstreaming, but
for now we're staying in our own little corner. :bow: :heart:


#### Development

A `docker-compose.yml` exists for easy local development. `docker-compose up`
will start the database and app server. `docker-compose run web <command>` can
be used to run development commands. For example, to get started running the
application's tests:

- `docker-compose run web rake db:create`
- `docker-compose run web rake db:schema:load`
- `docker-compose run web rake`

Depending on which editor you use, it should be easy enough to configure your
test runner to run tests within the docker container.
