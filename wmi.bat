@echo off
cd /d "%~dp0"
title WMI - Loading...
mode 100,30
set mypath=%~dp0
set ver=0.2.0
echo ____________________________________________________________________________________________________
echo.
echo.
echo                                    ษออออออออออออออออออออออออออออป
echo                                    บ                            บ
echo                                    ศออออออออออออออออออออออออออออผ
echo.
echo                                    ษอออออออออออออออออป   ษออออออป   
echo                                    บ                 บ   บ      บ
echo                                    บ   ษอออออออออป   บ   ศออป   บ      
echo                                    บ   บ         บ   บ      บ   บ
echo                                    บ   บ         บ   บ      บ   บ    
echo                                    บ   บ         บ   ศออออออผ   บ 
echo                                    บ   บ         บ              บ
echo                                    ศอออผ         ศออออออออออออออผ
echo.
echo                                             FranzaGeek
echo ____________________________________________________________________________________________________
timeout /t 1 /nobreak > nul 2>&1
echo Prepairing variables...
set destdisk=
set indexvalue=
set untbc=
set pswyes=
timeout /t 1 /nobreak > nul 2>&1
echo Done, clearing up...
if exist "%mypath:~0,-1%\editions.txt" del /f /s /q "%mypath:~0,-1%\editions.txt" > nul
if exist "%mypath:~0,-1%\dpscript.txt" del /f /s /q "%mypath:~0,-1%\dpscript.txt" > nul
timeout /t 1 /nobreak > nul 2>&1
echo Done, reading a temporary file...
:beginning
set /p _stagex=<"%mypath:~0,-1%\stagenum.wmidat"
if "%_stagex%"=="" (
	echo File not found, creating...
	echo 0 >"%mypath:~0,-1%\stagenum.wmidat"
	echo OK, file created.
	goto :beginning
)
set _stage=%_stagex:~0,-1%
echo Reading "stagenum.wmidat"...
timeout /t 1 /nobreak > nul 2>&1
echo Stage successfully set, proceeding...
timeout /t 2 /nobreak > nul 2>&1
:splashscreen
cls
title Windows Manual Installer UEFI Edition %ver% - Stage %_stage%
mode 100,30
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo.                                                                 
echo                                  ##    ##   ##   ##    ##       ##
echo                                  ##   ###  ##   ###   ###      ##
echo                                  ##  ## # ##   ## #  ## #     ##
echo                                  ## #  ## #   ## ## #  ##    ##
echo                                  ###   ###   ##  ###   ##   ##
echo                                  ##    ##   ##   ##    ##  ##
echo.
echo.
echo.
echo.
echo                                      Windows Manual Installer
echo                                      Developed by ^<franzageek^>
echo.                                            
echo                                      Stage %_stage%
echo.
echo.
echo.
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo  Press ENTER to begin...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
@pause > nul
cls
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo     This program is meant to be used to install Windows.
echo     For further details visit: https://github.com/franzageek/wmi
echo.
echo     The code is licensed to you under the terms of the MIT license, and the program comes with
echo     no warranty at all.
echo     I'm not the responsible for any damage that may be caused to your PC.
echo     Use WMI at your own risk. 
echo.
echo     This program is going to use the following preinstalled tools: DISKPART, DISM, BCDBOOT,
echo     NET, REG, WINDEPLOY.
echo.
echo     The program will run in 3 stages:  
echo     - Stage 0: The first stage, where the disk gets prepared, where the boot files get created
echo                and where the Windows Image gets applied;
echo     - Stage 1: After the first reboot WinDeploy gets started, and the user account is setted up;
echo     - Stage 2: After the second reboot, the Windows Modules Installer gets started, and the
echo                installation is complete. When you get to the desktop, run WMI the last time by
echo                an elevated CMD pormpt.
ECHO.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo  Press ENTER when ready...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
@pause > nul
if "%_stage%"=="0" goto :stage0
if "%_stage%"=="1" goto :stage1
if "%_stage%"=="2" goto :stage2
cls
color cf
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Error
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo     An error occurred.
echo     Please try to reboot your PC.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.    
echo.
echo.
echo.
echo.
echo.
ECHO.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo  Press ENTER to exit...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
@pause > nul
exit

:stage0
cls
color 1f
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 0/6
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are at the first part of the installation. We need to do some things:
echo.
echo.
echo               - Checking the installation drive
echo.
echo               - Checking WMI launch point
echo.
echo               - Prepairing the disk
echo.
echo               - Installing Windows
echo.
echo               - Creating boot files
echo.
echo               - Updating Registry settings
echo.
echo.
echo.
echo.
ECHO.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo  Loading...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(echo exit) | diskpart > nul
@dism > nul
cls
color 1f
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 0/6
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are at the first part of the installation. We need to do some things:
echo.
echo.
echo               - Checking the installation drive
echo.
echo               - Checking WMI launch point
echo.
echo               - Prepairing the disk
echo.
echo               - Installing Windows
echo.
echo               - Creating boot files
echo.
echo               - Updating Registry settings
echo.
echo.
echo.
echo.
ECHO.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo  Loading...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
cls
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/6
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are at the first part of the installation. We need to do some things:
echo.
echo.
echo               * Checking the installation drive...
echo.
echo               - Checking WMI launch point
echo.
echo               - Prepairing the disk
echo.
echo               - Installing Windows
echo.
echo               - Creating boot files
echo.
echo               - Updating Registry settings
echo.
echo.
echo.
echo.
ECHO.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Checking the installation drive...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
set /a att_times=0
	:detect_drive
	set /a att_times=%att_times%+1
	if %att_times%==16 (
	color cf
	echo [ERROR]: Cannot find the installation medium. Press ENTER to exit and then reboot your PC.
	pause > NUL
	exit
	)
	setlocal enableDelayedExpansion
	set installdrive=NUL
	set counter=-1
	set letters=ABCDEFGHIJKLMNOPQRSTUVWXYZ
	set looking_for=

	:detect_drive_2
	set /a counter=%counter%+1
	set looking_for=!letters:~%counter%,1!
	if exist %looking_for%:\setup.exe (
		if exist %looking_for%:\sources\ (
			if exist %looking_for%:\sources\install.esd (
				set installfile=install.esd
			)
			if exist %looking_for%:\sources\install.wim (
				set installfile=install.wim
			)

		)
		set installdrive=%looking_for%
		goto :found
	)

	if %looking_for%==Z (
	set installdrive=NUL
	echo  Not found. Re-attempting...
	set /a counter=-1
	goto :detect_drive
	)

	goto detect_drive_2
	pause
	
	:found
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 2/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               * Checking WMI launch point...
	echo.
	echo               - Prepairing the disk
	echo.
	echo               - Installing Windows
	echo.
	echo               - Creating boot files
	echo.
	echo               - Updating Registry settings
	echo.
	echo.
	echo.
	echo.
	ECHO.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Checking WMI launch point...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	if "%~dp0"=="C:\" (
		color cf
		echo [ERROR]: The C: letter is already taken from another drive^^! Fix the error,
		echo then reboot.
		echo          [TESTED, WORKING: You can fix the error by connecting 2 USBs, both 
		echo          with WMI in, start it from the one that is not a C: drive and then 
		echo          unplug the other one.]
		pause
		exit
	)
	if "%installdrive%"=="C" (
		color cf
		echo [ERROR]: The C: letter is taken from the installation drive^^! 
		echo          Fix the error and reboot.
		echo          [You can fix the error by booting from a CD or a DVD if you can.]
		Pause
		exit 
	)

	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 3/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               # Checking WMI launch point...
	echo.
	echo               * Prepairing the disk
	echo.
	echo               - Installing Windows
	echo.
	echo               - Creating boot files
	echo.
	echo               - Updating Registry settings
	echo.
	echo.
	echo.
	echo.
	ECHO.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Starting DiskPart...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo lis dis >"%mypath:~0,-1%\dpscript.txt"
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 3/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        Look at the number of the disk you want to install Windows on:      
	echo.
	(echo lis dis)  | diskpart &echo.
	echo.
	echo        REMEMBER: The selected disk will be formatted, and all the data will be lost.
	echo        To abort the installation, close this window.
	echo.
	:tempbookmark0
	set /p destdisk=       Enter the number [just the number] of the disk where you want to install Windows on:
	FOR /F "tokens=2" %%a IN ('diskpart /s dpscript.txt') DO (
		if "%%a"=="%destdisk%" goto :proceedwdp
		if "%destdisk%"=="" goto :tempbookmark0
	)
	echo Disk number not valid.
	set destdisk=
	goto :tempbookmark0
	
	:proceedwdp
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 3/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               # Checking WMI launch point
	echo.
	echo               * Prepairing the disk...
	echo.
	echo               - Installing Windows
	echo.
	echo               - Creating boot files
	echo.
	echo               - Updating Registry settings
	echo.
	echo.
	echo.
	echo.
	ECHO.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Starting DiskPart...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	(echo sel dis %destdisk%
	echo conv gpt
	echo cre par efi size=500
	echo for fs=fat32
	echo ass letter W
	echo cre par pri
	echo for fs=ntfs quick
	echo ass letter C
	exit
	)  | diskpart > nul
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               # Checking WMI launch point
	echo.
	echo               # Prepairing the disk
	echo.
	echo               * Installing Windows...
	echo.
	echo               - Creating boot files
	echo.
	echo               - Updating Registry settings
	echo.
	echo.
	echo.
	echo.
	ECHO.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Initializing...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	if exist "%mypath:~0,-1%\dpscript.txt" del /s /f /q "%mypath:~0,-1%\dpscript.txt"
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        Now, you need to select the edition you want to install.
	echo        A notepad window should appear, and you'll see something like this:
	echo.
	echo ### EXAMPLE: 
	echo.
	echo     Index : 1
	echo     Name  : Windows 10 Home
	echo     Description : Windows 10 Home
	echo     Size  : [size in bytes]
	echo.
	echo     Index : 2
	echo     Name  : Windows 10 Pro
	echo     Description : Windows 10 Pro
	echo     Size  : [size in bytes]
	echo.
	echo        Choose your favourite edition, read the INDEX number and type it below.
	echo        (EXAMPLE: if you want to install Windows 10 Pro, in this case you have to type 2.)
	echo.
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Press ENTER to view the editions for your ISO file...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	@pause > nul
	cd /d %installdrive%:\sources
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo [Close the Notepad window before proceeding]
	echo.
	dism /english /get-wiminfo /wimfile:%installfile% >"%mypath:~0,-1%\editions.txt"
	notepad "%mypath:~0,-1%\editions.txt"
	echo Enter below the INDEX number for your editon [only the number, no spaces].
	echo.
	echo REMEMBER: If no valid INDEX value is provided, the edition corrisponding to INDEX:1 will be
	echo           installed.
	echo.
	echo NOTICE: If the Notepad window showed an error, type "0" at the prompt below.
	echo         You will be redirected to WMI Rollback, which will try to fix the error.
	echo.
	:tempbookmark1
	set /p indexvalue=INDEX:
	if "%indexvalue%"=="0" (
		FOR /F "tokens=1,2,3,4,5 delims= usebackq" %%A IN ("%mypath:~0,-1%\editions.txt") DO (
			if /i "%%A"=="Error: 2" (
				goto :be4begdism
			)
		)
	)
	
	FOR /F "tokens=3 usebackq" %%a IN ("%mypath:~0,-1%\editions.txt") DO (
		if "%%a"=="%indexvalue%" goto :be4begdism
		if "%indexvalue%"=="" goto :tempbookmark1
	)
	echo INDEX number not valid.
	set indexvalue=
	goto :tempbookmark1

	:be4begdism
	set emergencystring=echo.
	:beginningdism
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               # Checking WMI launch point
	echo.
	echo               # Prepairing the disk
	echo.
	echo               * Installing Windows...
	echo.
	echo               - Creating boot files
	echo.
	echo               - Updating Registry settings
	echo.
	%emergencystring%
	dism /apply-image /imagefile:%installfile% /index:%indexvalue% /applydir:C:\
	if "%errorlevel%"=="87" (
		set indexvalue=1
		set emergencystring=echo  ### The INDEX value was incorrect, installing INDEX:1...
		goto :beginningdism
	)
	if "%errorlevel%"=="2" (
		for %%a in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
			if exist "%%a:\sources\install.wim" (
				set installfile="%%a:\sources\install.wim"
				goto :beginningdism
			)
			if exist "%%a:\sources\install.esd" (
				set installfile="%%a:\sources\install.esd"
				goto :beginningdism
			)
		)
		call :wmirollback 1
		
	)
	
	if "%errorlevel%"=="3" (
		call :wmirollback 2
	)
	
	if exist "%mypath:~0,-1%\editions.txt" del /f /s /q "%mypath:~0,-1%\editions.txt" > nul
	
	

	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 5/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               # Checking WMI launch point
	echo.
	echo               # Prepairing the disk
	echo.
	echo               # Installing Windows
	echo.
	echo               * Creating boot files...
	echo.
	echo               - Updating Registry settings
	echo.
	echo.
	echo.
	echo.
	ECHO.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	bcdboot C:\Windows /s W: /F UEFI
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 6/6
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo        You are at the first part of the installation. We need to do some things:
	echo.
	echo.
	echo               # Checking the installation drive
	echo.
	echo               # Checking WMI launch point
	echo.
	echo               # Prepairing the disk
	echo.
	echo               # Installing Windows
	echo.
	echo               # Creating boot files
	echo.
	echo               * Updating Registry settings...
	echo.
	echo.
	echo.
	echo.
	ECHO.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Updating the Registry...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	reg load "HKLM\SOFT" "C:\Windows\System32\config\SOFTWARE" > nul
	reg load "HKLM\SYS" "C:\Windows\System32\config\SYSTEM" > nul
	reg add "HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /f /t REG_DWORD /d "1" > nul
	reg add "HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /f /t REG_DWORD /d "0" > nul
	reg add "HKLM\SYS\Setup" /v "CmdLine" /f /t REG_SZ /d "cmd.exe /k C:\wmi.bat" > nul

	:end_stage0
	color 3f
	cls
	echo.
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 End
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo.
	echo.
	echo    *** READ CAREFULLY ***
	echo.
	echo.
	echo    You completed Stage 0 of WMI. Now, remove the installation media and press ENTER to reboot 
	echo    your PC. At the boot, you should see a CMD window. WMI should automatically launch from
	echo    that CMD window.
	echo    NOTE: WMI is no longer located on your USB drive, but it's now located on the C:\ drive.
	echo    The WMI copy on your USB drive is going to be resetted in order not to cause filename conflicts 
	echo    while running WMI.
	echo.
	echo    WMI will automatically start the Stage 1, after the Disclaimer screen. 
	echo    See you on the other side^^!
	echo.
	echo.
	echo    [Remove the installation medium, then press ENTER to reboot Windows.]
	echo.
	echo.
	echo.
	echo.	
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Remove the installation medium [not WMI's USB],  then press ENTER...
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	@pause > nul
	color
	cd /d "%mypath%"
	echo 1 >"%mypath:~0,-1%\stagenum.wmidat"
	cd /d C:\
	copy /Y "%mypath:~0,-1%\wmi.bat" "C:\wmi.bat" > nul
	copy /Y "%mypath:~0,-1%\stagenum.wmidat" "C:\stagenum.wmidat" > nul
	del /f /s /q "%mypath:~0,-1%\stagenum.wmidat" > nul
	wpeutil reboot




:stage1
cd /d C:\
cls
color 1f
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/3
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are now at the second part of the installation. Please wait...
echo.
echo.
echo               * Setting up drivers and services...
echo.
echo               - Creating the user account
echo.
echo               - Updating the Registry
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ECHO.	
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Starting WinDeploy...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
cd /d C:\Windows\System32\
oobe\windeploy
cls
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/3
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are now at the second part of the installation. Please wait...
echo.
echo.
echo               # Setting up drivers and services
echo.
echo               * Creating the user account...
echo.
echo               - Updating the Registry
echo.
echo.
:tempbookmark2
set /p untbc=Enter your username:
if /i "%untbc%"=="" goto :tempbookmark2
if /i "%untbc%"=="con" set untbc=User
if /i "%untbc%"=="aux" set untbc=User
if /i "%untbc%"=="nul" set untbc=User
echo.
Choice /c yn /m "Do you want to add a password?"
If "%errorlevel%"=="2" goto :pswno
If "%errorlevel%"=="1" goto :pswyes
:pswyes
set /p pswyes=Enter your password:
If /i "%pswyes%"=="" goto :pswyes
If /i "%pswyes%"==" " goto :pswyes
If /i "%pswyes%"=="." goto :pswyes
If /i "%pswyes%"==";" goto :pswyes
If /i "%pswyes%"=="#" goto :pswyes
net user /add "%untbc%" "%pswyes%" >nul 2>&1
net localgroup /add users "%untbc%" >nul 2>&1
net localgroup /add administrators "%untbc%" >nul 2>&1
Goto :doneuser

:pswno
net user /add "%untbc%" >nul 2>&1
net localgroup /add users "%untbc%" >nul 2>&1
net localgroup /add administrators "%untbc%" >nul 2>&1
Goto :doneuser

:doneuser
cls
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/3
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are now at the second part of the installation. Please wait...
echo.
echo.
echo               # Setting up drivers and services
echo.
echo               # Creating the user account
echo.
echo               * Updating the Registry...
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ECHO.	
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Updating the Registry...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
reg add "HKLM\SYSTEM\Setup" /v "OOBEInProgress" /f /t REG_DWORD /d "0" >nul
reg add "HKLM\SYSTEM\Setup" /v "SetupType" /f /t REG_DWORD /d "0" >nul
reg add "HKLM\SYSTEM\Setup" /v "SystemSetupInProgress" /f /t REG_DWORD /d "0" >nul

:end_stage1
color 3f
cls
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage %_stage%                                 End
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        *** READ CAREFULLY ***
echo.
echo.
echo        You completed Stage 1 of WMI. Press ENTER to start Stage 2. After you hit ENTER, wait
echo        about 40 seconds and the PC will restart. Once the PC is restarted, you should see the 
echo        loading screen that says "Please wait for TrustedInstaller" and then "Please wait 
echo        for Windows Modules Installer" or something like that. This is the sign that you're
echo        currently into Stage 2. Wait for the restart, and then you should see the lockscreen
echo        with your user account. Log in and then wait until the end of the prepairing process.
echo        Next, you'll have to set up privacy settings. After that, you're good to go^! You will
echo        have to start WMI another time to clean the environment and to show the Credits screen.
echo        Start it by typing "c:\wmi.bat" from an elevated CMD prompt.
echo.
echo        Then, you can use Windows as always^!
echo.
echo.
echo.
echo.
ECHO.	
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Press ENTER to get into Stage 2...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
@pause > nul
color
echo 2 >"%mypath:~0,-1%\stagenum.wmidat"
echo @echo off >"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo title WMI Warning >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo mode 80,15 >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo color 0f >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo echo. >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo echo   ************************************************************************ >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo echo   *  Remember to run WMI [C:\wmi.bat] another time to complete Stage 2!  * >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo echo   ************************************************************************ >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo echo. >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo pause >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
echo exit >>"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat"
exit

:stage2
CLS 
net session >nul 2>&1
if "%errorlevel%"=="0" (
	goto :s2end
) else (
	echo To complete Stage 2, please run WMI from an elevated CMD prompt.
	title
	exit /b
) 
:s2end 
cls
color 1f
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage 2                                        Step 1/1
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        You are now at the third part of the installation. Please wait...
echo.
echo.
echo               * Cleaning up the environment...
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ECHO.	
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Please wait...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
if exist "C:\stagenum.wmidat" del /f /s /q "C:\stagenum.wmidat" > nul
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat" del /f /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\temp.bat" > nul

title Windows Manual Installer UEFI Edition %ver% - End
color 9f
cls
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo     Windows Manual Installer %ver% - Stage 2                                        End
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo.
echo        Thank you for choosing to use WMI! We hope we have done a good job.
echo        If you encountered any kind of problem, please open a issue at the repository, at the 
echo        link "github.com/franzageek/wmi/issues" and we will try to fix it as soon as possible.
echo.
echo        Windows Manual Installer UEFI version %ver%  
echo        Developed by ^<franzageek^>                  
echo.                                                    
echo                      github.com/franzageek          
echo                      youtube.com/c/FranzaGeek       
echo.                                                    
echo        [feel free to follow me if you want!]    
echo.
echo        Including WMI Rollback 0.1.0 UEFI edition
echo.
echo        Copyright [c] FranzaGeek 2021-2022. All rights are reserved.
echo.
echo.
echo        To report issues: "github.com/franzageek/wmi/issues"
ECHO.	
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Press ENTER to exit...
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
@pause > nul
title %cd%
@color
cd /d "%mypath%"
cls
(goto) 2>nul & del "%~f0"
exit /b


:wmirollback
if "%1"=="1" set problem=iwnf
if "%1"=="2" set problem=adnf
::iwnf = install.wim not found
::adnf = applydir not found
cls
color
title WMI Rollback 0.1.0
mode 100,30
echo.
echo   ############################# WMI Rollback UEFI version 0.1.0 ##################################
echo   ###                                                                                          ###
echo   ###    Welcome to WMI Rollback 0.1.0. There seems to be a problem with the WMI installing    ###
echo   ###  process. WMI Rollback will revert all the changes made to your disk, in order to make   ###
echo   ###               it fully working and ready for a next Windows installation.                ###
echo   ###                                                                                          ###
echo   ### The hard drive you selected earlier will be FULLY FORMATTED and ALL the data on it will  ###
echo   ###                                    be LOST forever.                                      ###
echo   ###                                                                                          ###
echo   ####################### A WMI dependency - not distributable separately. #######################
echo.
echo.
echo   [Press ENTER when ready...]
pause > nul
cls
echo.
echo   [**] Decoding error code...
if "%problem%"=="iwnf" goto :iwnf
if "%problem%"=="adnf" goto :adnf

	:adnf
	color
	echo   [OK] Error code decoded successfully.
	echo   [**] Prepairing the disk...
	(echo sel dis %destdisk%
	echo sel par 1
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 2
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 3
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 4
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 5
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 6
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 7
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 8
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 9
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo sel par 10
	echo clean
	echo conv mbr
	echo conv gpt
	echo del par
	echo cre par pri
	)  | diskpart > nul 2>&1
	echo.
	echo   [OK] Disk prepared.
	echo   [**] Formatting the disk...
	echo.
	echo        This may take some time, depending on the size of your disk.
	echo        WARNING: DO NOT close the window OR cancel the formatting process,
	echo                 this will CORRUPT you drive PERMANENTLY.
	(echo select disk %destdisk% & echo conv mbr &echo conv gpt &echo sel par 1 &echo format fs=ntfs) | diskpart 
	echo.
	echo   [OK] Disk formatted. 
	goto :wmirbe
	
	:iwnf
	echo   [OK] Error code decoded successfully.
	echo.
	color 0c
	echo   FATAL ERROR: the file "install.wim" could not be found.
	echo                This is an essential file which contains all the 
	echo                compressed Windows files. This file is meant to be extracted 
	echo                during the installation process.
	echo.
	echo                The setup process cannot proceed. We'll revert all the changes made
	echo                to your disks.
	echo.
	echo   Press ENTER to proceed...
	pause > nul
	echo   Resetting error code...
	goto :adnf
	
	
	
:wmirbe
cls
echo.
echo   ############################# WMI Rollback UEFI version 0.1.0 ##################################
echo   ###                                                                                          ###
echo   ###  Congratulations, you reached the end of the reverting phase^^! Now your hard disk should  ###
echo   ###    be ready for a new installation. Since it is now formatted NTFS, we suggest you to    ###
echo   ###                      install Windows again, instead of using                             ###
echo   ###       it for other things [to store files or install Linux] because NTFS is not          ###
echo   ###                        the best solution for that kind of usage.                         ###
echo   ###                                                                                          ###
echo   ###    NOTE: the UEFI edition of WMI Rollback 0.1.0 doesn't support the use of WMI after     ###
echo   ###               the hard disk formatting process due to unknown bugs.                      ###
echo   ###  We'll try to fix the problem as soon as possible. For now, the only thing you can do is ###
echo   ###            to install Windows from scratch using the default installer.                  ###
echo   ###                                                                                          ###
echo   ###               To ensure that your drive is now ready for the installation,               ###
echo   ###                              press ENTER to close WMI.                                   ###
echo   ###                                                                                          ###
echo   ####################### A WMI dependency - not distributable separately. #######################
echo.
echo.
echo   [Please press ENTER to close WMI...]
pause > nul
if exist "%mypath:~0,-1%\editions.txt" del /f /s /q "%mypath:~0,-1%\editions.txt" > nul
if exist "%mypath:~0,-1%\dpscript.txt" del /f /s /q "%mypath:~0,-1%\dpscript.txt" > nul
if exist "%mypath:~0,-1%\stagenum.wmidat" del /f /s /q "%mypath:~0,-1%\stagenum.wmidat" > nul
exit


