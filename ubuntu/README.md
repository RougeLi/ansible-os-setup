# Ubuntu-Specific Ansible OS Setup

此目錄包含針對 Ubuntu 作業系統的 Ansible Playbooks、主機清單和相關設定，適用於快速部署 Docker 和 Git 等常見的系統套件。

## Inventories 目錄

`inventories` 目錄內的 `hosts` 文件存放了目標主機的相關資訊。  
在此文件中指定要部署的主機及其參數，如 IP 地址、使用者、SSH 憑證文件等。

範例 `hosts` 文件：

```yaml
all:
  hosts:
    target_host:
      ansible_host: 'YOUR_HOST_IP'  # 遠端主機的 IP
      ansible_user: 'ubuntu'        # 連接主機的使用者
      cloud_provider: 'AWS'         # GCP, AWS, IDC, Other
      ansible_ssh_private_key_file: '/credentials/os_setup_rsa'  # 可選，SSH 私鑰憑證文件 (絕對路徑)
```

### Host Configuration

1. 請務必複製 `hosts.yaml.example` 文件並創建實際的 `hosts.yaml` 文件來配置目標主機。  
   這樣可以避免敏感資訊被直接提交至版本控制中。

   **複製範例文件：**
   ```bash
   cp hosts.yaml.example hosts.yaml
   ```

2. 編輯 `hosts.yaml` 文件，設定遠端主機的 IP 地址和 SSH 憑證。

   ```bash
   nano hosts.yaml
   ```

## Cloud Provider 變數說明

`cloud_provider` 是一個自定義變數，用來指定主機所在的雲端提供商或基礎設施環境。  
在 `inventories/hosts` 文件中使用該變數來區分不同環境的主機。

變數的可能值如下：

- **GCP**: 代表 Google Cloud Platform 上的主機。
- **AWS**: 代表 Amazon Web Services 上的主機。
- **IDC**: 代表傳統的數據中心機房主機。
- **Other**: 其他類型的基礎設施或環境。


## credentials 目錄

`credentials` 目錄存放各種憑證文件，如 SSH 私鑰、AWS 存取金鑰等。  
