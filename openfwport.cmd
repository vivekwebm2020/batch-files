@echo off
setlocal
if {%1}=={} goto syntax
if {%2}=={} goto syntax
if {%3}=={} goto syntax

netsh firewall set portopening protocol = %1 port = %2 name = %3 mode = ENABLE scope = ALL
goto finish

:syntax
@echo Syntax: openfwport PROTOCOL PORT DESCRIPTION

:finish
endlocal