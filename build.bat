@echo off

set name=Unrivaled

xcopy /s /y .\%name%\ %Appdata%\Balatro\Mods\%name%\*

exit