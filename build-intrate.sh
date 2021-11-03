#!/bin/bash

set -ex

if [ "$1" != "ref" ] && [ "$1" != "test" ] && [ "$1" != "train" ]; then
    echo "Must specify ref/test/train"
    exit 1
fi

if [ $2 -le 0 ]; then
    echo "rate type, Must specify gt 0"
    exit 1
fi

echo "Building SPEC2006 Intrate with $1 inputs"
make spec06-intrate INPUT=$1 RATE=$2 SUITE=int
