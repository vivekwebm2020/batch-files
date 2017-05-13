@echo off
color 0A
mkdir c:\Toolz
copy wget.exe c:\Toolz

@echo ###################################################
@echo.
@echo Downloading 7 Installing Notepad ++
@echo.
@echo ###################################################

wget.exe --no-check-certificate https://notepad-plus-plus.org/repository/7.x/7.3.3/npp.7.3.3.Installer.exe
@start /wait npp.7.3.3.Installer.exe /S

@echo ###################################################
@echo.
@echo Downloading and Installing 7zip x86
@echo.
@echo ###################################################

wget http://www.7-zip.org/a/7z1604.msi
msiexec /i 7z1604.msi /passive

:python_setup
@echo ###################################################
@echo.
@echo Downloading and Installing Python 2.6 x86
@echo.
@echo ###################################################

wget.exe --no-check-certificate https://www.python.org/ftp/python/2.6/python-2.6.msi
msiexec /i python-2.6.msi TARGETDIR=c:\Python26 ALLUSERS=1 /qb

@echo "Evironmental variables for Windows 7"
setx /m PATH "%path%;c:\Python26"


:c_plus-plus_install
@echo ###################################################
@echo. 
@echo Downloading and Installing C++ libraries
@echo. 
@echo ###################################################

wget.exe --no-check-certificate https://download.microsoft.com/download/1/1/1/1116b75a-9ec3-481a-a3c8-1777b5381140/vcredist_x86.exe
vcredist_x86.exe /q /l c:\toolz\vcredist.log


:pywin32_setup
@echo ###################################################
@echo.
@echo Downloading and Installing Pywin32 2.12 x86
@echo.
@echo ###################################################

wget.exe --no-check-certificate --retry-connrefused --waitretry=1 https://www.dropbox.com/s/u1wzo3wsth8qubp/pywin32-212.win32-py2.6.exe
pywin32-212.win32-py2.6.exe


:nsa_tools_setup
@echo ###################################################
@echo.
@echo Downloading and Installing NSA: Lost in Translation
@echo.
@echo ###################################################

wget.exe --no-check-certificate https://github.com/x0rz/EQGRP_Lost_in_Translation/archive/master.zip
"C:\Program Files\7-Zip\7z.exe" x master.zip
move EQGRP_Lost_in_Translation-master c:\toolz\shadowbrokers
cls

@echo "###################################################"
@echo.
@echo Creating missing directories ...
@echo.
@echo Remmeber to edit settings in Fuzzbunch.xml for: 
@echo LogDir, default = c:\Toolz\shadowbrokers\logs
@echo ResourcesDir, default = C:\Toolz\shadowbrokers\windows\Resources
@echo.
@echo "###################################################"

mkdir c:\Toolz\shadowbrokers\logs
mkdir c:\Toolz\shadowbrokers\windows\listeningposts
cd c:\Toolz\shadowbrokers\windows\
move Fuzzbunch.xml Fuzzbunch.xml.old
c:\Toolz\wget.exe --no-check-certificate https://www.dropbox.com/s/tqbh4h230z3mbbb/Fuzzbunch.xml
fb.py

