#!/bin/sh

set -e

wally install

# Patch the Wally package link modules to also export Luau type definitions.
rojo sourcemap default.project.json -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages/
