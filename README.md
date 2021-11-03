SPEC2006 Workload
=================

Requirements
------------

- SPEC2006 installed and have `SPEC_DIR` env. variable point to installation
- riscv-toolchain

Getting Started
---------------

When you first install this repository, you should update all submodules:

    git submodule update --init --recursive spec2006

After that you can use FireMarshal as normal and point to the `json` workload configs:

    # Assuming marshal is on your $PATH
    marshal build ./marshal-configs/spec06-intrate.json


See https://firemarshal.readthedocs.io/en/latest/index.html for FireMarshal
documentation.

test
    ./build-intrate.sh ref 5
    ./build-intspeed.sh ref

ref
--------

[SPEC2017 Workload](https://github.com/ucb-bar/spec2017-workload)


