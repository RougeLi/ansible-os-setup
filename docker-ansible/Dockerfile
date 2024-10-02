FROM ubuntu:22.04

# 更新系統並安裝必要的依賴項（包括 pip）
# - `software-properties-common`: 用於管理軟體倉庫的工具
# - `ca-certificates`: 安裝 SSL 證書的基本套件，用於 HTTPS 安全連線
# - `libssl-dev`: OpenSSL 庫，為某些加密操作提供支持
# - `libffi-dev`: 用於構建一些 Python 庫的依賴
# - `python3-pip`: Python 3 的 pip，用於安裝 Python 套件
# - `ssh`: 用於遠端連線操作
RUN apt-get update && \
    apt-get install -y software-properties-common ca-certificates libssl-dev libffi-dev python3-pip ssh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 使用 pip 安裝 Ansible 和 passlib
# - `ansible`: 自動化工具，用於配置管理和應用部署
# - `passlib`: 用於密碼加密的 Python 庫，適用於 Ansible 用戶管理
RUN pip3 install --no-cache-dir ansible passlib

# 複製 ansible.cfg 文件到 Ansible 的預設配置路徑
COPY ansible.cfg /etc/ansible/ansible.cfg

# 創建 /credential 目錄，用於存放憑證和私鑰
RUN mkdir -p /credential

# 創建 /extra_files 目錄，用於存放額外的檔案，例如模板或配置檔
RUN mkdir -p /extra_files

# 創建 /inventories 目錄，用於存放 Inventory 檔案
RUN mkdir -p /inventories

# 設置默認命令，檢查 Ansible 版本來確認安裝成功
CMD [ "ansible-playbook", "--version" ]
