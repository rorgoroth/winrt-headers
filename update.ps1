Invoke-WebRequest -Uri https://github.com/microsoft/cppwinrt/releases/download/2.0.240405.15/Microsoft.Windows.CppWinRT.2.0.240405.15.nupkg -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox -OutFile cppwinrt.7z
7z.exe x -y cppwinrt.7z -ocppwinrtbin

Invoke-WebRequest -Uri  https://github.com/microsoft/windows-rs/raw/master/crates/libs/bindgen/default/Windows.winmd -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox -OutFile Windows.winmd

Remove-Item -Recurse -Force .\include

Move-Item -Force .\cppwinrtbin\bin\cppwinrt.exe .
.\cppwinrt.exe -in '.\Windows.winmd' -out '.\include'

Remove-Item -Force cppwinrt.7z
Remove-Item -Force cppwinrt.exe
Remove-Item -Force Windows.winmd
Remove-Item -Recurse -Force .\cppwinrtbin
