#!/bin/bash

username=$(whoami)

cd ~/tonos-cli/target/release/ && \
        ./tonos-cli \
        call $(cat ~/tonos-cli/target/release/$username.addr) \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi ~/tonos-cli/target/release/SafeMultisigWallet.abi.json \
        --sign ~/tonos-cli/target/release/$username.keys.json
