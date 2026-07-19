Set-Variable -Name workspace -Value $Env:KHAOSDATA_WORKSPACE
Set-Variable -Name mod_base -Value $Env:FACTORIO_STEAM_MODS_BASE
Set-Variable -Name package -Value "khaosdata-extractor"

New-Item -ItemType Directory -Force -Path "$mod_base\$package" | Out-Null

Set-Variable -Name version -Value (Get-Content "$workspace\$package\info.json" | ConvertFrom-Json).version
Move-Item -Path "$workspace\$package\${package}_${version}.zip" -Destination "${mod_base}\${package}" -Force -ErrorAction SilentlyContinue

Start-Process -FilePath "C:\Program Files (x86)\Steam\steam.exe" -ArgumentList "-applaunch 427520 --mod-directory $mod_base\$package --load-scenario base/freeplay"
