#!/bin/bash

BRANCH="${1:-master}"
MODULE_PATH="${2:-src}"

echo "Inicializando uso de los modulos."
git submodule init

modules=("core" "helper" "route" "web" "cli")
modules+=("db" "model" "validate" "renderer" "ui")
modules+=("api" "admin" "meta" "auth" "studio")
modules+=("ddml" "mail" "workflow")

for name in "${modules[@]}"; do
  echo "Agregando $name."
  git submodule add --name "kyubi/$name" -f -b $BRANCH git@github.com:kyubiproject/$name.git "$MODULE_PATH/$name"
  
  # Copiando enlace simbolico a los hooks.
  ln -sf "$(pwd)/bin/hooks" ".git/modules/kyubi/$name/hooks"
done

echo "Actualizando modulos."
git submodule update --init --recursive

# Cambia todos los plugins de rama.
git submodule foreach "git switch $BRANCH || :";



