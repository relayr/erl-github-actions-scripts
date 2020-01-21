# erl-travis-scripts

This repository contains `rebar.config.script` that is used by `rebar3` to customize building of Erlang applications.

What this script does when run in [Travis CI](https://travis-ci.org) environment:
- configure [Erlang plugin](https://github.com/markusn/coveralls-erl) for integration with [coveralls.io](https://coveralls.io)
- configure [rebar3_hex](https://github.com/tsloughter/rebar3_hex) plugin for publishing of packages to [Hex](https://hex.pm)

### Usage

To use scripts from this repository in your Erlang application built in [Travis CI](https://travis-ci.org) you should add `erl-travis-scripts` repository as a submodule e.g.
```
$ git submodule add https://github.com/relayr/erl-travis-scripts.git .travis
```

Travis CI will automatically initialize the submodule. Then you can make use of `rebar.config.script` by copying it to your project in `travis.yml` file and execute customized `rebar3` commands:
##### .travis.yml
```
language: erlang
before_script: cp .travis/rebar.config.script .
script:
  - rebar3 eunit --cover
  - rebar3 as test coveralls send
```
