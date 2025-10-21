#!/bin/bash

# Encrypt incoming through stdin.

openssl enc -=aes-256-cbc -pbkdf2 -iter 310000 -sale -pass pass:$PASSPHRASE
