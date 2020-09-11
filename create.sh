#!/bin/bash

username=$(whoami)

cd ~/tonos-cli/target/release
./tonos-cli getkeypair $username.keys.json ${1}
