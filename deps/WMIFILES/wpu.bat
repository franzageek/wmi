@echo off
net session >nul 2>&1
if "%errorlevel%"=="0" (
	goto :s2e
) else (
	set "params=%*"
	cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
) 
:s2e
title WMI Post-Ins Utility
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
@chcp 65001 >nul
:main
set adm_u=
color 0f
mode 47, 35
cls
echo.                                            
echo   ___________________________________________
echo.
call :colorecho 0b "          WMI"
echo  Post-Install Utility    
echo        _________________________________     
echo.
echo.
echo        [1] ^|  Activate Windows (MAS)*
echo            ^|
echo        [2] ^|  Create a new user account   
echo            ^|
echo        [3] ^|  Install Google Chrome*
echo            ^|
echo        [4] ^|  WMI files cleanup
echo.
echo.
echo        [5] ^|  Open "franzageek/WMI" repo*
echo            ^|
echo        [6] ^|  Show "Credits" screen
echo            ^|
echo        [0] ^|  Exit
echo.
echo. 
echo        [R] ^|  Refresh Screen
echo.
echo.
echo.
echo             (*: Internet required)     
echo        _________________________________    
echo.
call :colorecho 0a "     Enter a menu option in the keyboard"
choice /c 1234560r /N /M ":"
if "%errorlevel%"=="8" rem 0
if "%errorlevel%"=="7" exit
if "%errorlevel%"=="6" goto :about_scr
if "%errorlevel%"=="5" start https://github.com/franzageek/wmi
if "%errorlevel%"=="4" goto :del_wmi
if "%errorlevel%"=="3" start https://www.google.com/chrome/
if "%errorlevel%"=="2" goto :new_user
if "%errorlevel%"=="1" start C:\WMIFILES\MAS_AIO.cmd
goto :main



	:new_user
	mode 47, 35
	cls
	echo.
	echo   ___________________________________________
	echo.
	echo              User account creation      
	echo        _________________________________        
	echo.
	echo.
	:tempbookmark0
	set /p "untbc=-Enter your username:"
	if /i "%untbc%"=="" set untbc=User
	if /i "%untbc%"=="con" set untbc=User
	if /i "%untbc%"=="aux" set untbc=User
	if /i "%untbc%"=="nul" set untbc=User
	echo.
	call :colorecho 0f " Do you want to add a password [Y,N]"
	Choice /c yn /N /m "?"
	If "%errorlevel%"=="2" goto :pswno
	If "%errorlevel%"=="1" goto :pswyes
	:pswyes
	set /p "pswyes=-Enter your password:"
	If /i "%pswyes%"=="" goto :pswyes
	If /i "%pswyes%"==" " goto :pswyes
	If /i "%pswyes%"=="." goto :pswyes
	If /i "%pswyes%"==";" goto :pswyes
	If /i "%pswyes%"=="#" goto :pswyes


	echo.
	call :colorecho 0f " Do you want your user to be admin [Y,N]"
	Choice /c yn /N /m "?"
	If "%errorlevel%"=="2" set adm_u=0
	If "%errorlevel%"=="1" set adm_u=1

	echo.
	call :colorecho 0f " Create the user account [Y,N]"
	Choice /c yn /N /m "?"
	If "%errorlevel%"=="2" goto :main 
	If "%errorlevel%"=="1" rem 0

	net user /add "%untbc%" "%pswyes%" >nul 2>&1
	net localgroup /add users "%untbc%" >nul 2>&1

	if "%adm_u%"=="1" (
		net localgroup /add administrators "%untbc%" >nul 2>&1
	)
	echo.
	call :colorecho 0a " - User account successfully created"
	echo.
	pause
	goto :main

	:pswno
	echo.
	call :colorecho 0f " Do you want your user to be admin [Y,N]"
	Choice /c yn /N /m "?"
	If "%errorlevel%"=="2" set adm_u=0
	If "%errorlevel%"=="1" set adm_u=1

	echo.
	call :colorecho 0f " Create the user account [Y,N]"
	Choice /c yn /N /m "?"
	If "%errorlevel%"=="2" goto :main
	If "%errorlevel%"=="1" rem 0

	net user /add "%untbc%" >nul 2>&1
	net localgroup /add users "%untbc%" >nul 2>&1

	if "%adm_u%"=="1" (
		net localgroup /add administrators "%untbc%" >nul 2>&1
	)
	echo.
	call :colorecho 0a " - User account successfully created"
	echo.
	pause
	goto :main
	
	
	:about_scr
	mode 76, 30
	cls
	echo        ______________________________________________________________    
	echo.	
	echo                                WMI - Credits                              
	echo              __________________________________________________
	echo.
	echo        █  █  █   █  █     █   
	echo        █ ██ █   ██ ██    █    Windows Manual Installer
	echo        ██ ██   █ ██ █   █     Developed by ^<franzageek^>
	echo        █  █   █  █  █  █      
	echo.
	echo.
	echo        WMI is licensed to you under the terms stated by the MIT license,
	echo        for further details see file COPYING.
	echo.  
	echo        Big thanks to WindowsAddict for allowing me to use his MAS project.
	echo.       Discover it at "github.com/massgravel/Microsoft-Activation-Scripts".
	echo.
	echo        WMI Rollback is a WMI dependency, and it is not distributable 
	echo        separately.
	echo.
	echo        Made with love by ^<franzageek^> ["github.com/franzageek"]                                  
	echo              __________________________________________________
	echo.
	echo                         Press any key to go back...                  
	echo        ______________________________________________________________     
	pause>nul
	goto :main
	
	:del_wmi
	cls.
	cls
	echo.                                             
	call :colorecho 04 "  ___________________________________________"
	echo.
	echo.
	call :colorecho 0c "                 Uninstall WMI"
	echo.          
	call :colorecho 04 "       _________________________________"
	echo.
	echo.
	echo.
	echo        [U] ^|  Uninstall WMI
	echo            ^|
	echo        [B] ^|  Go back 
	echo.
	echo.
	call :colorecho 07 "   This will affect the following files"
	echo :
	echo.
	echo    "C:\wmi.exe"      ^<-- WMI executable
	echo    "C:\WMIFILES\"    ^<-- WMI folder
	echo    "C:\...\wpu.bat"  ^<-- This utility
	echo.
	echo.
	echo.
	echo.
	echo. 
	echo.
	call :colorecho 0c "        There's no way to revert this," 
	echo.
	call :colorecho 04 "             so please be careful"
	echo;.          
	echo.
	echo.
	call :colorecho 04 "       _________________________________"   
	echo.
	echo.
	call :colorecho 03 "     Enter a menu option in the keyboard"
	choice /c ub /N /M ":"
	if "%errorlevel%"=="2" goto :main
	if "%errorlevel%"=="1" rem 0
	echo      Please wait a while...
	del /f /s /q "C:\Windows\System32\sethc.exe" >nul
	rename "C:\Windows\System32\oldsethc.exe" "sethc.exe" >nul
	del /f /s /q "C:\libgcc_s_seh-1.dll" >nul
	del /f /s /q "C:\libstdc++-6.dll" >nul
	del /f /s /q "C:\libwinpthread-1.dll" >nul
	rmdir /S /Q "C:\WMIFILES\" >nul
	del /f /s /q "C:\wmi.exe" >nul
	mode 76, 30
	cls
	echo        ______________________________________________________________    
	echo.	
	echo                                WMI - Credits                              
	echo              __________________________________________________
	echo.
	echo        █  █  █   █  █     █   
	echo        █ ██ █   ██ ██    █    Windows Manual Installer
	echo        ██ ██   █ ██ █   █     Developed by ^<franzageek^>
	echo        █  █   █  █  █  █      
	echo.
	echo.
	echo        WMI is licensed to you under the terms stated by the MIT license,
	echo        for further details see file COPYING.
	echo.  
	echo        Big thanks to WindowsAddict for allowing me to use his MAS project.
	echo.       Discover it at "github.com/massgravel/Microsoft-Activation-Scripts".
	echo.
	echo        WMI Rollback is a WMI dependency, and it is not distributable 
	echo        separately.
	echo.
	echo        Made with love by ^<franzageek^> ["github.com/franzageek"]                                  
	echo              __________________________________________________
	echo.
	echo                          Press any key to close...                  
	echo        ______________________________________________________________     
	pause>nul
	cls
	prompt You can now close this window.
	(goto) 2>nul & del "%~f0"
	
	
	
	
	

pause
:colorecho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof