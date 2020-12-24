#!/usr/bin/env sh

# Credit to https://github.com/andrewrothstein

set -e
DIR=/tmp
APPNAME=flux
MIRROR=https://github.com/fluxcd/flux2/releases/download
VERSION=0.5.7

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-tar.gz}
    local platform="${os}_${arch}"
    local file="${APPNAME}_${ver}_${platform}.${suffix}"
    local url=$MIRROR/v$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux arm
    dl $ver windows 386 zip
    dl $ver windows amd64 zip
}

dl_ver ${1:-$VERSION}
