#!/bin/bash

hostname=$(hostname -s)

cd ~/net.ton.dev/tonos-cli/target/release
./tonos-cli run 0:754a80838edae0902068152e78ef8cbd6c1edd693e2fda339a49cfebd75ae96e \
        getTransactions {} --abi SafeMultisigWallet.abi.json | awk 'FNR == 20 {print $2}' | tr -d '"\,' > ~/ton-keys/gov.confirm.txid

txid=$(cat ~/ton-keys/gov.confirm.txid)
./tonos-cli call 0:754a80838edae0902068152e78ef8cbd6c1edd693e2fda339a49cfebd75ae96e \
        confirmTransaction "{"\"transactionId"\":"\"$txid"\"}" \
        --abi SafeMultisigWallet.abi.json --sign "$hostname.keys.json"
