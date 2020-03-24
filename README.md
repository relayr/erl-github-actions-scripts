# erl-github-actions-scripts

![GitHub actions](https://raw.githubusercontent.com/github/explore/2c7e603b797535e5ad8b4beb575ab3b7354666e1/topics/actions/actions.png)

This repository is a fork of https://github.com/relayr/erl-travis-scripts.

### Description
Scripts contained in this repository can be used to build and deploy Erlang applications using [GitHub actions](https://github.com/features/actions). Steps that can be executed with these scripts:
- run unit tests
- run property based tests with [PropEr](https://github.com/proper-testing/proper) if available
- export test coverage to [coveralls.io](https://coveralls.io)
- publish package to [Hex](https://hex.pm)

This repository also contains `rebar.config.script` that is used by `rebar3` to customize configuration of Erlang applications.

What it does is:
- configure [Erlang plugin](https://github.com/markusn/coveralls-erl) for integration with [coveralls.io](https://coveralls.io)
- configure [rebar3_hex](https://github.com/tsloughter/rebar3_hex) plugin for publishing of packages to [Hex](https://hex.pm)

### Usage

To use scripts from this repository in your Erlang application built in GitHub you should add `erl-github-actions-scripts` repository as a submodule e.g.
```
$ git submodule add https://github.com/relayr/erl-github-actions-scripts.git .github/scripts
```

Then you can make use of `rebar.config.script` by copying it to your project in `.github/workflows/*.yml` and execute customized scripts:

##### .github/workflows/ci.yml
```
name: Erlang CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
  release:
    types: [published]

jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: erlang:22.0

    steps:
    - uses: actions/checkout@v1.0.0
      with:
        submodules: true
    - name: Configure
      run: cp .github/scripts/rebar.config.script .
    - name: Build
      run: .github/scripts/build.sh
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    - name: Publish
      if: github.event_name == 'release' && github.event.action == 'published'
      run: .github/scripts/publish.sh
      env:
        HEX_API_KEY: ${{ secrets.HEX_API_KEY }}
```

If you want to publish package to [Hex](https://hex.pm) e.g. when release is published you should add `HEX_API_KEY` secret containing your own key to GitHub repository settings (https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets#creating-encrypted-secrets).
