Set-Variable -Name workspace -Value $Env:KHAOSDATA_WORKSPACE
Set-Variable -Name mod_base -Value $Env:FACTORIO_21_MODS_BASE
Set-Variable -Name package -Value "khaosdata-extractor"

New-Item -ItemType Directory -Force -Path "$mod_base\$package" | Out-Null

Set-Variable -Name version -Value (Get-Content "$workspace\$package\info.json" | ConvertFrom-Json).version
Move-Item -Path "$workspace\$package\${package}_${version}.zip" -Destination "${mod_base}\${package}" -Force -ErrorAction SilentlyContinue

Start-Process -FilePath "${Env:FACTORIO_21_PATH}\bin\x64\Factorio.exe" -ArgumentList "--mod-directory ${mod_base}\${package} --load-scenario base/freeplay"
