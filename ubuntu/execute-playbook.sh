#!/bin/bash

# 切換到腳本所在的目錄
cd "$(dirname "$0")" || exit

# 設置憑證文件的權限為 600
chmod 600 credentials/*

# 如果有提供參數，則使用該參數作為 Playbook，否則默認為 deploy-infra.yaml
PLAYBOOK=${1:-deploy-infra.yaml}

# 使用 docker run 運行 Ansible Playbook 並設置 ANSIBLE_CONFIG 環境變量
docker run --rm \
  -v ./ansible:/ansible \
  -v ./credentials:/credentials \
  -w /ansible/playbooks \
  ansible-os-setup ansible-playbook "$PLAYBOOK"
