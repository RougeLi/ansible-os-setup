# Ansible OS Setup for Any Base OS (Ubuntu, Windows, etc.)

此專案提供了一個自動化解決方案，利用 Ansible 來針對各種作業系統（如 Ubuntu、Windows 等）快速部署所需的套件與標準化設定。  
透過 Ansible Playbooks 的執行，無論是開發環境還是生產環境，都可以根據特定需求產生相應的基礎設施映像 (Infra Image)。

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Directory Structure](#directory-structure)
- [Customization](#customization)

## Prerequisites

在開始之前，請確保系統中已安裝以下軟體：

- Docker

## Setup

1. **克隆專案到本地**：
    ```bash
    git clone https://github.com/RougeLi/ansible-os-setup.git
    cd ansible-os-setup
    ```

2. **設置憑證檔案**：
   將所需的憑證文件（例如 `.pem`、`.json` 檔案）放置於 `credential` 目錄下。

3. **構建 Ansible Docker 映像**：
   在專案的 `docker-ansible` 目錄中，您可以運行以下腳本來構建 Docker 映像：

    ```bash
    ./docker-ansible/build-ansible-image.sh
    ```

   這會構建一個名為 `ansible-os-setup` 的 Docker 映像，用於之後的 Playbook 執行。

## Usage

要利用此專案的 Ansible Playbooks，請按照以下步驟操作：

1. **執行 Playbook**：
   使用 `ubuntu` 目錄下的 `execute-playbook.sh` 腳本來執行 Playbook。此腳本允許您傳入要運行的 Playbook 作為參數，或者如果沒有指定，則默認執行 `deploy-infra.yaml`。

   **默認運行 `deploy-infra.yaml`**：
   ```bash
   ./execute-playbook.sh
   ```

   **指定其他 Playbook 運行**：
   ```bash
   ./execute-playbook.sh custom-playbook.yaml
   ```

   這會啟動 Ansible 容器，並根據您指定的 Playbook 進行執行。

## Directory Structure

專案的目錄結構如下所示：

```
ansible-os-setup/
├── docker-ansible/
│   ├── build-ansible-image.sh     # 構建 Ansible Docker 映像的腳本
│   ├── Dockerfile                 # Docker 映像的定義文件
├── ubuntu/
│   └── ansible/
│       ├── inventories/           # Ansible 主機清單
│       ├── playbooks/             # Ansible Playbooks
│       ├── roles/                 # Ansible 角色
│   ├── credential/                # 用於存放憑證檔案
│   ├── execute-playbook.sh        # 用於執行 Ansible Playbook 的腳本
│   └── README.md
├── windows/
│   ├── ansible/
│   ├── credential/
│   ├── execute-playbook.sh
│   └── README.md
└── another-os/
    ├── ansible/
    ├── credential/
    ├── execute-playbook.sh
    └── README.md
```

## Customization

- 若需修改 Playbooks 或新增更多角色，請編輯 `ansible/playbooks/` 或 `ansible/roles/` 目錄下的檔案。
- 若需調整部署的目標主機，請更新 `ansible/inventories/` 內的主機清單。
- 確保憑證檔案已正確放置於 `credential` 目錄中，並且在 `hosts` 文件中指定了正確的路徑，例如：
  ```yaml
  ansible_ssh_private_key_file: '/credential/os_setup_rsa'
  ```
