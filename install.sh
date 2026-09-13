#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

SDK_VERSION=$1
if [[ "$SDK_VERSION" == "" ]]; then
    echo "Usage: install.sh [VERSION]"
    echo "  where VERSION is 165, 164, 163, ..., 100"
    exit 1
fi
SDK_FILENAME="steamworks_sdk_$SDK_VERSION.zip"

cd ${THIS_DIR}/dist
unzip -o ${SDK_FILENAME} -d ${THIS_DIR}
