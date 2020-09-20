#!/bin/bash

username=$(whoami)

HALF_PUBKEY=$(cat ~/tonos-cli/target/release/$username.keys.json | grep 'public' | awk '{print $2}' | tr -d '"' | tr -d ',')
FULL_PUBKEY=$(printf "0x%s" "$HALF_PUBKEY")

#2 - deploy wallet with the custodian key from #1 with fullpaths for all necessary files and reqConfirm:1
function deployWallet () {
        cd ~/tonos-cli/target/release && \
        ./tonos-cli deploy ~/tonos-cli/target/release/SafeMultisigWallet.tvc \
        "{"\"owners"\":["\"$FULL_PUBKEY"\"],"\"reqConfirms"\":1}" \
        --abi ~/tonos-cli/target/release/SafeMultisigWallet.abi.json \
        --sign ~/tonos-cli/target/release/$username.keys.json \
        --wc 0
}

deployWallet
