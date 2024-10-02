FROM ubuntu:22.04

# 更新系統並安裝必要的依賴項（包括 pip）
RUN apt-get update && \
    apt-get install -y software-properties-common ca-certificates libssl-dev libffi-dev python3-pip ssh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 使用 pip 安裝 Ansible 和 passlib
RUN pip3 install --no-cache-dir ansible passlib

# 複製 ansible.cfg 文件
COPY ansible.cfg /etc/ansible/ansible.cfg

# 設置默認命令
CMD [ "ansible-playbook", "--version" ]
