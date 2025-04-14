#!/bin/bash

echo "Eliminando modulos."
git submodule deinit -f --all

# Borrando directorios
rm -rf src .git/modules
