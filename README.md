# P2S VPN Certificates Generator

This repository provides PowerShell scripts to generate **self-signed certificates** for **Point-to-Site (P2S) VPN authentication** in **Azure**.

## 🚀 Features
- **generate-root-cert.ps1** → Creates a **root certificate** for signing.
- **generate-client-cert.ps1** → Generates a **client certificate** signed by the root certificate.
- Uses **SHA-256 encryption** with **2048-bit key length**.

## 📌 Prerequisites
- Windows 10/11 or Windows Server with **PowerShell 5+**.
- Run PowerShell as **Administrator**.

## 🛠 Usage
1. **Generate the Root Certificate**
   ```powershell
   .\scripts\generate-root-cert.ps1
