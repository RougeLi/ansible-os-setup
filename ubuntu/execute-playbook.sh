#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Playbook 未進行設置"
    exit 1
fi

cd "$(dirname "$0")" || exit
echo "所在工作目錄：$PWD"

chmod 600 ./credentials/*
echo "設置憑證文件的權限為 600"

DOCKER_COMMAND=(
  docker run --rm
  -v "./ansible:/ansible"
  -v "./credentials:/credentials"
  -v "./extra_files:/extra_files"
  -v "./inventories:/inventories"
  -w /ansible/playbooks
  ansible-os-setup ansible-playbook
)
DOCKER_COMMAND+=("$@")

echo "執行指令: ${DOCKER_COMMAND[*]}"
"${DOCKER_COMMAND[@]}"
