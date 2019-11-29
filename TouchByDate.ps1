# TouchByDate
# Des fichiers nommés par ordre alphabétique mais avec des timecodes mélangés ? Voici la solution ! 
#
# Touch : Set-ItemProperty -Path $filetotouch -Name LastWriteTime -Value (get-date)

# erreur sur l'accent si UiCulture est autre que fr-fr : chercher une solution UTF8 pour read-host
[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
# est-ce que ça va le corriger ? 

# Dossier à cibler : 
$Dossier = Read-Host "Quel dossier ?"
if ($Dossier)
{
    Set-Location $Dossier
}
else 
{
    Throw "Dossier non spécifié"
    #quit
}

# Trier les fichiers par ordre alphabétique :
$ListeFichiers = Get-ChildItem | Sort-Object -Property Name

# Remettre les timecodes à plat : 
Get-ChildItem $ListeFichiers | ForEach-Object -Process {Set-ItemProperty $_ -Name CreationTime -Value (Get-Date)}
Get-ChildItem $ListeFichiers | ForEach-Object -Process {Set-ItemProperty $_ -Name LastAccessTime -Value (Get-Date)}
Get-ChildItem $ListeFichiers | ForEach-Object -Process {Set-ItemProperty $_ -Name LastWriteTime -Value (Get-Date)}

# Afficher le résultat :
Get-ChildItem