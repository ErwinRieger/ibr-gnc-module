
@echo off

set GNUCASH="%userprofile%\.gnucash"

@echo.
@echo Installiere config-user.scm und ibr-gnc-module.scm nach %GNUCASH% ...
@echo.

IF EXIST %GNUCASH% GOTO DIROK

mkdir %GNUCASH%

:DIROK

copy config-user.scm %GNUCASH%
copy ibr-gnc-module.scm %GNUCASH%

@echo.
@echo Installation beendet.
@echo.

pause 



