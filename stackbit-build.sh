#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e719ab356d937001b819ff3/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e719ab356d937001b819ff3
curl -s -X POST https://api.stackbit.com/project/5e719ab356d937001b819ff3/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e719ab356d937001b819ff3/webhook/build/publish > /dev/null
