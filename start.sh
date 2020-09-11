#!/bin/bash

username=$(whoami)

cd ~/tonos-cli/target/release
seed=$(./tonos-cli genphrase | awk 'FNR == 3' | sed 's/^.\{13\}//' | tr -d '"')
./tonos-cli genpubkey "$seed"
./tonos-cli getkeypair $username.keys.json "$seed"
