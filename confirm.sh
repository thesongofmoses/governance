#!/bin/bash

./tonos run 0:754a80838edae0902068152e78ef8cbd6c1edd693e2fda339a49cfebd75ae96e \
  getTransactions {} --abi SafeMultisigWallet.abi.json | awk 'FNR == 20 {print $2}' | tr -d '"\,'
