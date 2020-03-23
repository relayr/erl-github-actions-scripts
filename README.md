# erl-github-actions

![GitHub actions](https://raw.githubusercontent.com/github/explore/2c7e603b797535e5ad8b4beb575ab3b7354666e1/topics/actions/actions.png)

This repository is a fork of https://github.com/relayr/erl-travis-scripts.

### Description
Scripts contained in this repository can be used to build and deploy Erlang applications using [GitHub actions](https://github.com/features/actions). Steps that are executed:
- copy `rebar.config.script` to main directory of your application in order to execute customized `rebar3` commands
- run unit tests
- run property based tests with [PropEr](https://github.com/proper-testing/proper) if available
- export test coverage to [coveralls.io](https://coveralls.io)
- publish package to [Hex](https://hex.pm)

What `rebar.config.script` does is: 
- configure [Erlang plugin](https://github.com/markusn/coveralls-erl) for integration with [coveralls.io](https://coveralls.io)
- configure [rebar3_hex](https://github.com/tsloughter/rebar3_hex) plugin for publishing of packages to [Hex](https://hex.pm)

### Usage

To use scripts from this repository in your Erlang application built in GitHub you should add `erl-github-actions` repository as a submodule i.e.
```
$ git submodule add https://github.com/relayr/erl-github-actions.git .github
```

If you want to publish package to [Hex](https://hex.pm) e.g. when tag is created you should add `HEX_API_KEY` secret containing your own key to GitHub repository settings (https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets#creating-encrypted-secrets).
