# TouchByDate
# Touch : Set-ItemProperty -Path $filetotouch -Name LastWriteTime -Value (get-date)

$Dossier = Read-Host "Quel répertoire ?"
Set-Location $Dossier
$ListeFichiers = Get-ChildItem | Sort-Object -Property Name
Set-ItemProperty $ListeFichiers -Name LastWriteTime -Value (Get-Date)
Get-ChildItem