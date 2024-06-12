# Ustawienia
$repoUrl = "https://github.com/numeryczne/numeryczne"
$zipUrl = "$repoUrl/archive/refs/heads/main.zip"
$tempZipPath = "$env:TEMP\numeryczne-main.zip"
$extractPath = "$env:TEMP\numeryczne-main"
$debugPath = "$extractPath\numeryczne-main\Debug"
$appPath = "$debugPath\aplikacja1.exe"

# Pobranie pliku ZIP z repozytorium
Invoke-WebRequest -Uri $zipUrl -OutFile $tempZipPath

# Wypakowanie pliku ZIP
Expand-Archive -Path $tempZipPath -DestinationPath $extractPath

# Sprawdzenie, czy app.exe istnieje i uruchomienie go
if (Test-Path -Path $appPath) {
    & $appPath
} else {
    Write-Error "Plik app.exe nie został znaleziony w $debugPath"
}

# Czyszczenie tymczasowych plików
#Remove-Item -Path $tempZipPath -Force
#Remove-Item -Path $extractPath -Recurse -Force
