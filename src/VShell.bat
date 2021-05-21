@echo off
echo.>tar.vnc
echo. VNC's interactive shell
echo. ==========================
echo. Version 1.0.0
echo.
echo.
:loop
set /p inp=
if "%inp%" == "BatDau[c]" (
	start freakc tar.vnc
) else if "%inp%" == "Ngung[c]" (
	del /q tar.vnc
	if exist tar.bat (
		del /q tar.bat
	)
	exit /b
) else if "%inp%" == "Xoa[c]" (
	echo.>tar.vnc
) else if "%inp%" == "An[c]" (
	cls
) else (
	echo %inp%>>tar.vnc
)
goto loop