#!/bin/bash

# Encrypt incoming through stdin.

# -a Turns into Base64
openssl enc -aes-256-cbc -pbkdf2 -iter 310000 -salt -pass pass:"$PASSPHRASE" -a
