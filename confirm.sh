#!/bin/bash

username=$(whoami)

cd ~/tonos-cli/target/release
./tonos-cli call 0:db99769aa440d5ae8ce33f32d02a31c3979af04852227237b8d741c035be0a66 \
        confirmTransaction "{"\"transactionId"\":"\"${1}"\"}" \
        --abi SafeMultisigWallet.abi.json --sign ~/tonos-cli/target/release/"$username.keys.json"
