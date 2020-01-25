#!/bin/bash

set -e

rebar3 eunit --cover
if [ "`rebar3 as test tree | grep ' proper[^a-z_]'`" != "" ]; then
    rebar3 proper --cover
fi

rebar3 cover --verbose
rebar3 as test coveralls send
