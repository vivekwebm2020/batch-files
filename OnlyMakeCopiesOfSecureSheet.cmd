@echo off && setlocal
:: powershell -Command "& {$P=(Get-Location).ToString(); Copy-Item $P\VSCredentials_Active.xlsx $P\VSCredentials_Current.xlsx; Copy-Item $P\VSCredentials_Active.xlsx $P\VSCredentials_Present.xlsx}"
powershell -command "&Get-ChildItem -File | Where {$_.Extension -eq \".xlsx\" -And $_.Name -inotmatch \"Active.xlsx\" -And $_.Name -inotmatch \"Active_Personal.xlsx\"} | Remove-Item"
powershell -Command "& {$Today = "$(Get-Date -Format 'dd-MM-yyyy')"; $Now = "$(Get-Date -Format 'dd-MM-yyyy_HH-mm-ss')"; $P=(Get-Location).ToString(); $FNPs = @('InUse','Synced','Present','Current','NowUsed',"$Today","$Now"); Foreach($FNP in $FNPs){ Copy-Item $P\VSCredentials_Active.xlsx $P\VSCredentials_$FNP.xlsx;} }"
@echo off
attrib +h -s +r /s /d .* && clip < .pswd
attrib +h +s +r /s /d .* && exit
endlocal && GOTO :EOF && exit
