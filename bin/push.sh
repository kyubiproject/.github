#!/bin/bash

BRANCH="${1:-}"

# Ejecuta git push en cada submódulo (rama actual)
git submodule foreach "git pull origin $BRANCH || git push origin || :"
