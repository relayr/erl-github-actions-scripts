# erl-rebar-config

This repository contains `rebar.config.script` that is used by `rebar3` to customize building of Erlang applications.

What this script does when run in [Travis CI](https://travis-ci.org) environment:
- configure [Erlang plugin](https://github.com/markusn/coveralls-erl) for integration with [coveralls.io](https://coveralls.io)
- configure [rebar3_hex](https://github.com/tsloughter/rebar3_hex) plugin for publishing of packages to [Hex](https://hex.pm)