# Verifica se o Chocolatey está instalado, se não estiver, instala-o
if (!(Test-Path "C:\ProgramData\chocolatey")) {
    Write-Host "Chocolatey não encontrado. Instalando..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    $env:Path += ";C:\ProgramData\chocolatey\bin"
} else {
    Write-Host "Chocolatey já está instalado."
}

# Lista de pacotes a instalar com Chocolatey
$packages = @(
    "7zip",
    "adobereader",
    "atube-catcher",
    "choco",
    "chocolatey.gui",
    "crystaldiskinfo",
    "discord",
    "filezilla",
    "freac",
    "git",
    "googlechrome",
    "handbrake",
    "hidhide",
    "keepass",
    "logitech-ghub",
    "microsoft-office",
    "mobaxtrem",
    "mozilla-firefox",
    "notepadplusplus",
    "qbittorrent",
    "revo-uninstaller",
    "speedtest",
    "stremio",
    "visualstudiocode",
    "vlc",
    "winrar"
)

# Instalar pacotes
foreach ($package in $packages) {
    Write-Host "Instalando $package ..."
    choco install $package -y --force
}

Write-Host "Instalação concluída!"
