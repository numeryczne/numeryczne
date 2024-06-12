$fileUrl = "https://github.com/numeryczne/numeryczne/raw/main/plik.zip"
$destinationPath = "$env:USERPROFILE\plik.zip"
Start-BitsTransfer -Source $fileUrl -Destination $destinationPath

cd "$env:USERPROFILE"
Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('.\plik.zip', '.');
$exePath = ".\Debug\aplikacja1.exe"
Start-Process -FilePath $exePath