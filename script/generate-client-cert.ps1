# scripts/generate-client-cert.ps1

# Load the Root Certificate
$rootCert = Get-ChildItem -Path "Cert:\CurrentUser\My" | Where-Object { $_.Subject -eq "CN=VPNRoot" }

if (-not $rootCert) {
    Write-Host "Root certificate not found. Run generate-root-cert.ps1 first." -ForegroundColor Red
    exit
}

# Create the Client Certificate
$clientCert = New-SelfSignedCertificate -Type Custom -DnsName VPNCert -KeySpec Signature `
-Subject "CN=VPNCert" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $rootCert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

# Export the client certificate (with private key) for VPN authentication
$pfxPath = "$env:USERPROFILE\Desktop\VPNClientCert.pfx"
$password = Read-Host "Enter a password to protect the client certificate" -AsSecureString
Export-PfxCertificate -Cert $clientCert -FilePath $pfxPath -Password $password

Write-Host "Client certificate generated and exported to $pfxPath"
