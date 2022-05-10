#!/bin/sh -ue

# reformat shell scripts
find . -name \*.sh -exec shfmt -i 2 -w {} \+
