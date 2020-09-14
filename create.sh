#!/bin/bash

username=$(whoami)

cd ~/tonos-cli/target/release
./tonos-cli getkeypair $username.keys.json "${1}"
./tonos-cli genaddr SafeMultisigWallet.tvc SafeMultisigWallet.abi.json --setkey $username.keys.json --wc 0
./tonos-cli genaddr SafeMultisigWallet.tvc SafeMultisigWallet.abi.json --setkey $username.keys.json --wc 0 | awk 'FNR == 9 {print $3}' > $username.addr
