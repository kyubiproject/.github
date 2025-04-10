#!/bin/bash

BRANCH="${1:-}"

# Ejecuta git pull en cada submódulo (rama actual)
git submodule foreach "git pull origin $BRANCH || :"