#!/bin/bash

# Ejecuta git diff-index en cada submódulo y realiza el commit solo si hay cambios
git submodule foreach '
  if git diff-index --quiet HEAD --; then
    echo "No hay cambios en $sm_path."
  else
    if [ -z "$1" ]; then
      git commit -a --amend --no-edit || :
    else
      git commit -a -m "$1" || :
    fi
  fi
'