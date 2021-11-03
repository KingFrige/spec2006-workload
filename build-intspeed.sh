#!/bin/bash

set -ex

if [ "$1" != "ref" ] && [ "$1" != "test" ] && [ "$1" != "train" ]; then
    echo "Must specify ref/test/train"
    exit 1
fi

echo "Building SPEC2006 Intspeed with $1 inputs"
make spec06-intspeed INPUT=$1 RATE=0 SUITE=int
