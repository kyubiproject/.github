#!/bin/bash

BRANCH="${1:-}"

# Ejecuta git push en cada submódulo (rama actual)
git submodule foreach "git push origin $BRANCH || :"