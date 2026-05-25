
$date = (Get-Date).ToString("yyyyMMdd-HHmmss")

$MyDocs = [Environment]::GetFolderPath("MyDocuments")
$NinjaRoot   = "$MyDocs\NinjaTrader 8"
$NinjaScriptBin = "$NinjaRoot\bin"
$BackupFolder = "$MyDocs\NinjaTrader-Bin-Backups\Backup-$date"

# Source code and scripts
robocopy "$NinjaScriptBin" "$BackupFolder\bin" *.cs *.csproj *.sln *.xaml *.ps1 *.cmd *.json /s /xd ".git" ".vs" obj bin

# Templates -- workspaces, ATM strategies, chart templates, drawing tools
robocopy "$NinjaRoot\templates" "$BackupFolder\templates" /s /e

# Sound files -- keep in MySounds, not Program Files (survives NT updates)
robocopy "$NinjaRoot\MySounds" "$BackupFolder\MySounds" /s /e

# Persistent state -- machine-specific, good to have in backup
robocopy "$NinjaRoot\log\StateLogPersisted" "$BackupFolder\StateLogPersisted" /s /e

Write-Host "Backup complete: $BackupFolder"
Start-Sleep -Seconds 5
