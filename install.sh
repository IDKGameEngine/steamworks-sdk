#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

SDK_VERSION=$1
if [[ "$SDK_VERSION" == "" ]]; then
    echo "Usage: install.sh [VERSION]"
    echo "  where VERSION is 165, 164, 163, ..., 100"
    exit 1
fi
SDK_FILENAME="steamworks_sdk_${SDK_VERSION}.zip"

mkdir -p ${THIS_DIR}/download
cd ${THIS_DIR}/download

if [[ ! -f "${SDK_FILENAME}" ]]; then
    wget --content-disposition "https://partner.steamgames.com/downloads/${SDK_FILENAME}"
fi

unzip -o ${SDK_FILENAME} -d ${THIS_DIR}
