#!/bin/bash

set -e

rebar3 eunit --cover
if [ "`rebar3 plugins list | grep -E '^rebar3_proper$'`" != "" ]; then
    rebar3 proper --cover
fi

rebar3 cover --verbose
rebar3 as test coveralls send
