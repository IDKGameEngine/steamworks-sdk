#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

SDK_VERSION=165
SDK_ARCHIVE="steamworks_sdk_$SDK_VERSION.zip"

cd $THIS_DIR && mkdir -p dist && cd dist
unzip -o $SDK_ARCHIVE -d $THIS_DIR
