$fileUrl = "https://github.com/numeryczne/numeryczne/raw/main/publish.zip"
$destinationPath = "$env:USERPROFILE\publish.zip"
Invoke-WebRequest -Uri $fileUrl -OutFile $destinationPath

cd "$env:USERPROFILE"
Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('.\publish.zip', '.');
$exePath = ".\publish\aplikacja1.exe"
Start-Process -FilePath $exePath