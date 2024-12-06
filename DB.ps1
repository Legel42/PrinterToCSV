#transformer en csv et upload sur one note

Sutton(magog);EnBas;192.168.0.10;C300i;lienDriver
function SetupDB {
    "ENTREPRISE(VILLE) =$global:nomimprimante" | Out-File "$env:USERPROFILE\Desktop\TestDB\Imprimante.csv" -Force
    "EMPLACEMENT =$global:ip" | Out-File "$env:USERPROFILE\Desktop\TestDB\Imprimante.csv" -Append
    "IP =$global:chemindriver" | Out-File "$env:USERPROFILE\Desktop\TestDB\Imprimante.csv" -Append
    "MODELE =$global:driver" | Out-File "$env:USERPROFILE\Desktop\TestDB\Imprimante.csv" -Append
    "LIENDRIVER =$global:couleur" | Out-File "$env:USERPROFILE\Desktop\TestDB\Imprimante.csv" -Append
}

$Printer = Read-Host "Format: ENTREPRISE(VILLE);EMPLACEMENT;IP;MODELE"
$Driver = Read-Host "Copie et colle le lien du driver"

$DB = $Printer+$Driver


function Database {

    $infos = [ordered] @{ #Assigne les colonnes
        ENTREPRISE = $Entreprise
        VILLE = $Ville
        EMPLACEMENT = $Emplacement
        IP = $Ip
        MODELE = $Modele
        LIENDRIVER = $Lien
    }
    $infos | ForEach-Object{ [pscustomobject]$_ ; $_.MemberOfGroups} | Export-Csv -Path "$ou\Data.csv" -delimiter ":" -NoTypeInformation -Append #converti en customobject avant d'exporter sinon erreur d'affichage
}   

