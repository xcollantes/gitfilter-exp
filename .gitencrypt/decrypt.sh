#!/bin/bash

# Decrypt string using stdin.

# -a Turns into Base64.
openssl enc -d -aes-256-cbc -pbkdf2 -iter 310000 -salt -pass pass:"$PASSPHRASE" -a 2>/dev/null || cat
