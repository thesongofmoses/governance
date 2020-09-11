#!/bin/bash

cd ~/tonos-cli/target/release
./tonos-cli getkeypair $username.keys.json ${1}
