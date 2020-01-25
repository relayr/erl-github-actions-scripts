#!/bin/bash

set -e

rebar3 hex publish --repo hexpm --yes
