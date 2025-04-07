#!/bin/bash

BRANCH="${1:-master}"
MODULE_PATH="${2:-src}"

echo "Eliminando modulos."
git submodule deinit -f --all

echo "Inicializando uso de los modulos."
git submodule init

modules=("core" "helper" "route" "web" "cli")
modules+=("db" "model" "validate" "renderer" "ui")
modules+=("api" "admin" "meta" "auth" "studio")
modules+=("ddml" "mail" "workflow")

for name in "${modules[@]}"; do
  echo "Agregando $name."
  git submodule add --name "kyubi/$name" -f -b $BRANCH git@github.com:kyubiproject/$name.git "$MODULE_PATH/$name"
  
  # Creando enlace simbolico a los hooks.
  cd .git/modules/kyubi/$name && ln -sf ../../../hooks .
  cd ../../../..
  
done

echo "Actualizando modulos."
git submodule update --init --recursive

# Cambia todos los plugins de rama.
git submodule foreach "git switch $BRANCH || :";



