# erl-travis-scripts

### Description
Scripts contained in this repository can be used to build and deploy Erlang applications. Steps that are executed:
- run unit tests
- run property based tests with [PropEr](https://github.com/proper-testing/proper) if available
- export test coverage to [coveralls.io](https://coveralls.io)
- publish package to [Hex](https://hex.pm)

This repository also contains `rebar.config.script` that is used by `rebar3` to customize configuration of Erlang applications.

What it does when run in [Travis CI](https://travis-ci.org) environment is:
- configure [Erlang plugin](https://github.com/markusn/coveralls-erl) for integration with [coveralls.io](https://coveralls.io)
- configure [rebar3_hex](https://github.com/tsloughter/rebar3_hex) plugin for publishing of packages to [Hex](https://hex.pm)

### Usage

To use scripts from this repository in your Erlang application built in [Travis CI](https://travis-ci.org) you should add `erl-travis-scripts` repository as a submodule e.g.
```
$ git submodule add https://github.com/relayr/erl-travis-scripts.git .travis
```

Travis CI will automatically initialize the submodule. Then you can make use of `rebar.config.script` by copying it to your project in `travis.yml` file and execute customized `rebar3` commands.
##### .travis.yml
```
language: erlang
otp_release:
  - 22.0
before_script: cp .travis/rebar.config.script .
script: .travis/build.sh
```

If you want to publish package to [Hex](https://hex.pm) e.g. when tag is created you should run `deploy.sh` script by adding the following configuration to your `.travis.yml`:
```
deploy:
  provider: script
  script: .travis/deploy.sh
  skip_cleanup: true
  on:
    tags: true
```
