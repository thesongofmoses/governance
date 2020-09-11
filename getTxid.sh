#!/bin/bash

cd ~/tonos-cli/target/release
./tonos-cli run 0:db99769aa440d5ae8ce33f32d02a31c3979af04852227237b8d741c035be0a66 \
        getTransactions {} --abi SafeMultisigWallet.abi.json | awk 'FNR == 20 {print $2}' | tr -d '"\,' > ~/tonos-cli/target/release/gov.confirm.txid
