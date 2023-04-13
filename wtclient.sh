#!/bin/bash

OS="$(uname)"
case $OS in
    Linux)
        OS='linux'
        ;;
    *)
        echo 'OS not supported'
        exit 2
        ;;
esac

ARCH="$(uname -m)"
case $ARCH in
    x86_64|amd64|i?86|x86)
        ARCH='386'
        ;;
    aarch64|arm*)
        ARCH='arm'
        ;;
    *)
        echo 'OS type not supported'
        exit 2
        ;;
esac

LINK="https://github.com/aLnProject/barom-binary/raw/main/wtclient-${OS}-${ARCH}"

if [[ -d $1 && -n $1 ]]
then
    DIR="$1/wtclient"
else
    DIR="wtclient"
fi

curl -Lo "$DIR" "$LINK"
chmod +x "$DIR"