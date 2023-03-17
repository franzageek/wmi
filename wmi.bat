@echo off
cd /d "%~dp0"
title WMI - Loading...
mode 100,30
set mypath=%~dp0
set ver=0.2.3
echo ____________________________________________________________________________________________________
echo.
echo.
echo                                    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo                                    ³                            ³
echo                                    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo                                    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄ¿   
echo                                    ³                 ³   ³      ³
echo                                    ³   ÚÄÄÄÄÄÄÄÄÄ¿   ³   ÀÄÄ¿   ³      
echo                                    ³   ³         ³   ³      ³   ³
echo                                    ³   ³         ³   ³      ³   ³    
echo                                    ³   ³         ³   ÀÄÄÄÄÄÄÙ   ³ 
echo                                    ³   ³         ³              ³
echo                                    ÀÄÄÄÙ         ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
if "%_stage%"=="0" (
	if exist "%mypath:~0,-1%\log.wmilog" (
		call :wmirollback 4
	) else (
		echo ######## WMI %ver% > "%mypath:~0,-1%\log.wmilog"
	)
)
:splashscreen
cls
title Windows Manual Installer UEFI Edition %ver% - Stage %_stage%
mode 100,30
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 
echo ===================================================================================================
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
echo ===================================================================================================
echo  Press ENTER to begin...
echo ===================================================================================================
@pause > nul
cls
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 
echo ===================================================================================================
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
echo     - Stage 2: The Windows Modules Installer gets started, and the installation is complete.
echo.
echo.
ECHO.
echo ===================================================================================================
echo  Press ENTER when ready...
echo ===================================================================================================
@pause > nul
if "%1"=="/rollback" (
	if "%_stage%"==0 (
		call :wmirollback 3
	) else (
	rem Nothing
	)
)
if "%_stage%"=="0" goto :stage0
if "%_stage%"=="1" goto :stage1
cls
color cf
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Error
echo ===================================================================================================
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
echo ===================================================================================================
echo  Press ENTER to exit...
echo ===================================================================================================
@pause > nul
exit

:stage0
cls
color 1f
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 0/6
echo ===================================================================================================
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
echo ===================================================================================================
echo  Loading...
echo ===================================================================================================
(echo exit) | diskpart > nul
@dism > nul
cls
color 1f
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 0/6
echo ===================================================================================================
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
echo ===================================================================================================
echo  Loading...
echo ===================================================================================================
cls
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/6
echo ===================================================================================================
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
echo ===================================================================================================
echo Checking the installation drive...
echo ===================================================================================================
set /a att_times=0
:detect_drive
set installdrive=NUL
if %att_times%==16 (
	color cf
	echo [ERROR]: Cannot find the installation medium. Press ENTER to reboot your PC.
	pause > NUL
	wpeutil reboot
)

for %%a in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
	if exist "%%a:\setup.exe" (
		if exist "%%a:\sources\" (
			if exist "%%a:\sources\install.wim" (
				set installfile="%%a:\sources\install.wim"
			)
			if exist "%%a:\sources\install.esd" (
				set installfile="%%a:\sources\install.esd"
			)
		)
		set installdrive=%%a
		goto :found
	)
)
set installdrive=NUL
echo  Not found. Re-attempting...
set /a att_times=%att_times%+1
goto :detect_drive
	
	:found
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 2/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo Checking WMI launch point...
	echo ===================================================================================================
	if "%~dp0"=="C:\" (
		color cf
		echo [ERROR]: The C: letter is already taken from WMI's drive^! Fix the error,
		echo then reboot.
		echo.
		color cf
		goto :letter_selection_menu
	)
	if "%installdrive%"=="C" (
		color cf
		echo [ERROR]: The C: letter is taken from the installation drive^! 
		echo          Fix the error and reboot.
		echo          [You can fix the error by booting from a CD or a DVD if you can.]
		Pause
		if exist "%mypath:~0,-1%\stagenum.wmidat" del /f /s /q "%mypath:~0,-1%\stagenum.wmidat"
		exit 
	)
	if exist "C:\" (
		color cf
		echo [ERROR]: The C: letter is already taken from another drive^! Fix the error,
		echo then reboot.
		echo          [The error can be caused if you have 2 or more disks in your PC,
		echo           and Windows assigned the C: letter to one of them.]
		echo.
		echo.
		:letter_selection_menu
		echo Press ENTER to select another letter or close the window to abort the setup.
		pause
		cls
		color
		echo Now you have to choose a drive letter for Windows. You cannot use the C.
		echo Enter whatever letter of the alphabet you want, and WMI will assign that 
		echo letter to the disk you will select as the installation disk later.
		echo.
		echo Example: K [not K: , K:\ , "K" , "K:" or "K:\" , just K]
		echo.
		echo  [ENTER YOUR LETTER IN CAPS!]
		:checkletter
		echo.
		set /p windows_destination_letter=Enter the letter [just the letter] you want to install Windows to:
		if /i "%windows_destination_letter%"=="W" (
			echo System reserved letter.
			set windows_destination_letter=
			goto :checkletter
		)
		for %%a in ( A B D E F G H I J K L M N O P Q R S T U V X Y Z ) do (
			if /i "%windows_destination_letter%"=="%%a" (
				if exist "%%a:\" (
					echo Letter already taken. 
					set windows_destination_letter=
					goto :checkletter
				)
				if not exist "%%a:\" (
					set wil=%%a
					color 1f
					goto :diskpart_disk_prepairing
				)
			)
			if "%windows_destination_letter%"=="" (
					goto :checkletter
			)
					
		
		)
		set windows_destination_letter=
		goto :checkletter
	)
	set wil=C
	:diskpart_disk_prepairing
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 3/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo Starting DiskPart...
	echo ===================================================================================================
	echo lis dis >"%mypath:~0,-1%\dpscript.txt"
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 3/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 3/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo Starting DiskPart...
	echo ===================================================================================================
	(echo sel dis %destdisk%
	echo clean
	echo conv gpt
	echo cre par efi size=500
	echo for fs=fat32
	echo ass letter W
	echo cre par pri
	echo for fs=ntfs quick
	echo ass letter %wil%
	exit
	)  | diskpart > nul
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo Initializing...
	echo ===================================================================================================
	if exist "%mypath:~0,-1%\dpscript.txt" del /s /f /q "%mypath:~0,-1%\dpscript.txt"
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo Press ENTER to view the editions for your ISO file...
	echo ===================================================================================================
	@pause > nul
	cd /d %installdrive%:\sources
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo ===================================================================================================
	echo.
	echo.
	echo [Close the Notepad window before proceeding]
	echo.
	dism /english /get-wiminfo /wimfile:%installfile% >"%mypath:~0,-1%\editions.txt"
	notepad "%mypath:~0,-1%\editions.txt"
	echo Enter below the INDEX number for your editon [just the number, no spaces].
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
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 4/6
	echo ===================================================================================================
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
	dism /apply-image /imagefile:%installfile% /index:%indexvalue% /applydir:%wil%:\
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
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 5/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	bcdboot %wil%:\Windows /s W: /F UEFI
	echo ===================================================================================================

	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 6/6
	echo ===================================================================================================
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
	echo ===================================================================================================
	echo Updating the Registry...
	echo ===================================================================================================
	reg load "HKLM\SOFT" "%wil%:\Windows\System32\config\SOFTWARE" > nul
	reg load "HKLM\SYS" "%wil%:\Windows\System32\config\SYSTEM" > nul
	reg add "HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /f /t REG_DWORD /d "0" > nul
	reg add "HKLM\SYS\Setup" /v "CmdLine" /f /t REG_SZ /d "cmd.exe /k C:\wmi.bat" > nul

	:end_stage0
	color 3f
	cls
	echo.
	echo ===================================================================================================
	echo     Windows Manual Installer %ver% - Stage %_stage%                                 End
	echo ===================================================================================================
	echo.
	echo.
	echo    *** READ CAREFULLY ***
	echo.
	echo.
	echo    You completed Stage 0 of WMI. Now, remove the installation media and press ENTER to reboot 
	echo    your PC. At the boot, you should see a CMD window. WMI should automatically launch from
	echo    that CMD window.
	echo    NOTE: WMI is no longer located on your USB drive, but it's now located on the %wil%:\ drive.
	echo    The WMI copy on your USB drive is going to be reset in order not to cause filename conflicts 
	echo    while running WMI.
	echo.
	echo    WMI will automatically start the Stage 1 after the Disclaimer screen. 
	echo    See you on the other side^!
	echo.
	echo.
	echo    [Remove the installation medium, then press ENTER to reboot Windows.]
	echo.
	echo.
	echo.
	echo.	
	echo ===================================================================================================
	echo Remove the installation medium [not WMI's USB],  then press ENTER...
	echo ===================================================================================================
	@pause > nul
	color
	cd /d "%mypath%"
	echo 1 >"%mypath:~0,-1%\stagenum.wmidat"
	cd /d %wil%:\
	copy /Y "%mypath:~0,-1%\wmi.bat" "%wil%:\wmi.bat" > nul
	copy /Y "%mypath:~0,-1%\stagenum.wmidat" "%wil%:\stagenum.wmidat" > nul
	del /f /s /q "%mypath:~0,-1%\stagenum.wmidat" > nul
	del /f /s /q "%mypath:~0,-1%\log.wmilog" > nul
	wpeutil reboot




:stage1
cd /d C:\
cls
color 1f
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/3
echo ===================================================================================================
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
echo ===================================================================================================
echo Starting WinDeploy...
echo ===================================================================================================
cd /d C:\Windows\System32\
oobe\windeploy
cls
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/3
echo ===================================================================================================
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
Choice /c yn /m "Do you want to add a password"
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
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 Step 1/3
echo ===================================================================================================
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
echo ===================================================================================================
echo Updating the Registry...
echo ===================================================================================================
reg add "HKLM\SYSTEM\Setup" /v "OOBEInProgress" /f /t REG_DWORD /d "0" >nul
reg add "HKLM\SYSTEM\Setup" /v "SetupType" /f /t REG_DWORD /d "0" >nul
reg add "HKLM\SYSTEM\Setup" /v "SystemSetupInProgress" /f /t REG_DWORD /d "0" >nul

:end_stage1
color 3f
cls
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage %_stage%                                 End
echo ===================================================================================================
echo.
echo.
echo        *** READ CAREFULLY ***
echo.
echo.
echo        You completed Stage 1 of WMI. Press ENTER to begin Stage 2. After you hit ENTER, all
echo        the temporary files used from WMI will be deleted. Wait until the process is completed.
echo        Then, the PC should reboot, and you will see the "Getting Windows ready" loading screen.
echo        After that, you'll get to the desktop, and all the setup procedure is completed.                                                                                       
echo.
echo        Then, you can use Windows as always^!
echo.
ECHO.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ECHO.	
echo ===================================================================================================
echo Press ENTER to get into Stage 2...
echo ===================================================================================================
@pause > nul
set _stage=2
:stage2
CLS 
title Windows Manual Installer %ver% - Stage 2
cls
color 1f
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage 2                                        Step 1/1
echo ===================================================================================================
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
echo ===================================================================================================
echo Please wait...
echo ===================================================================================================
if exist "C:\stagenum.wmidat" del /f /s /q "C:\stagenum.wmidat" > nul

title Windows Manual Installer %ver% - End
color 9f
cls
echo.
echo ===================================================================================================
echo     Windows Manual Installer %ver% - Stage 2                                        End
echo ===================================================================================================
echo.
echo.
echo        Thank you for choosing to use WMI! We hope we've done a good job.
echo        If you encountered any kind of problem, please open an issue at the repository, at the 
echo        link "github.com/franzageek/wmi/issues" and we will try to fix it as soon as possible.
echo.
echo        Windows Manual Installer UEFI version %ver%  
echo        Developed by ^<franzageek^>                  
echo.                                                    
echo                      github.com/franzageek          
echo.      
echo.                                                    
echo        [feel free to follow me if you want!]    
echo.
echo        Including WMI Rollback UEFI 0.1.6
echo.
echo        Copyright [c] FranzaGeek 2021-2023. All rights are reserved.
echo.
echo.
echo        To report issues go to: "github.com/franzageek/wmi/issues"
ECHO.	
echo ===================================================================================================
echo Press ENTER to exit...
echo ===================================================================================================
@pause > nul
title %cd%
@color
cd /d "%mypath%"
cls
prompt Rebooting the system, this will take a bit...
shutdown /r /t 2 /c "WMI has scheduled a reboot for you."
(goto) 2>nul & del "%~f0"
exit /b


:wmirollback
set wrbst=you selected earlier
if "%1"=="1" set problem=iwnf
if "%1"=="2" set problem=adnf
if "%1"=="3" (
	set problem=ifcl
	set "wrbst=you will select now "
)
if "%1"=="4" set problem=wsnc
::iwnf = install.wim not found
::adnf = applydir not found
::ifcl = invoked from command line
::wsnc = WMI setup not completed
cls
color
title WMI Rollback UEFI 0.1.6
mode 100,30
echo.

echo   ############################## WMI Rollback UEFI version 0.1.6 #################################
echo   ###                                                                                          ###
echo   ### Welcome to WMI Rollback UEFI 0.1.6. There seems to be a problem with the WMI installing  ###
echo   ###  process. WMI Rollback will revert all the changes made to your disk, in order to make   ###
echo   ###               it fully working and ready for a next Windows installation.                ###
echo   ###                                                                                          ###
echo   ### The hard drive %wrbst% will be FULLY FORMATTED and ALL the data on it will  ###
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
if "%problem%"=="ifcl" goto :ifcl
if "%problem%"=="wsnc" goto :wsnc

	:adnf
	color
	echo   [OK] Error code decoded successfully.
	echo   [**] Formatting the disk...
	echo.
	echo        This may take some time, depending on the size of your disk.
	echo        WARNING: DO NOT close the window OR cancel the formatting process,
	echo                 this will CORRUPT you drive PERMANENTLY.
	(echo sel dis %destdisk%
	echo clean
	echo conv gpt
	echo cre par pri
	echo for fs=ntfs quick
	echo exit
	)  | diskpart > nul 2>&1
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
	echo                during the installation.
	echo.
	echo                The setup process cannot proceed. We'll revert all the changes made
	echo                to your disks.
	echo.
	echo   Press ENTER to proceed...
	pause > nul
	echo    [**] Resetting error code...
	goto :adnf
	
	:ifcl
	echo    [OK] Code decoded successfully.
	echo.
	echo  You started WMI Rollback from the command line. Select the disk you want to recover.
	echo.
	:dpdsp
	echo lis dis >"%mypath:~0,-1%\dpscript.txt"
	echo        Look at the number of the disk you want to recover:      
	echo.
	(echo lis dis)  | diskpart &echo.
	echo.
	echo.
	:tempbookmark3
	set /p destdisk=       Enter the number [just the number] of the disk you want to recover:
	FOR /F "tokens=2" %%a IN ('diskpart /s dpscript.txt') DO (
		if "%%a"=="%destdisk%" (
			echo Valid disk detected. Now you'll be redirected to the formatting process.
			echo.
			echo   [**] Resetting the code...
			goto :adnf
		)
		if "%destdisk%"=="" goto :tempbookmark3
	)
	echo Disk number not valid.
	set destdisk=
	goto :tempbookmark3
	
	:wsnc
	echo.
	echo    [OK] Error code decoded successfully.
	echo.
	echo    It seems that the WMI setup process has been killed before the end.
	echo    Now, the disk has to be recovered to make it ready again.
	echo.
	pause
	:destdisk_defined_but_not_correct
	if "%destdisk%"=="" goto :dpdsp
	if "%destdisk%" NEQ "" (
		for /l %%k in (0,1,50) do (
			if "%%k"=="%destdisk%" goto :adnf
			)
		)
		echo.
		echo  [E] Cannot detect the drive. Please press ENTER to show all the disks
		echo      in your PC.
		echo.
		pause
		set destdisk=
		goto :destdisk_defined_but_not_correct
	)
	
	
	
	
:wmirbe
cls
echo.
echo   ############################## WMI Rollback UEFI version 0.1.6 #################################
echo   ###                                                                                          ###
echo   ###  Congratulations, you reached the end of the reverting phase^! Now your hard disk should  ###
echo   ###       be ready for a new installation. Since it is now over NTFS, we suggest you to      ###
echo   ###         install Windows again, maybe using WMI or maybe not, instead of using            ###
echo   ###     it for other things [to store files or to install Linux] because NTFS might          ###
echo   ###                    not be the best solution for that kind of usage.                      ###
echo   ###                                                                                          ###
echo   ###                                                                                          ###
echo   ###                         Please press ENTER to reboot your PC.                            ###
echo   ###                                                                                          ###
echo   ####################### A WMI dependency - not distributable separately. #######################
echo.
echo.
echo   [Please press ENTER to reboot your PC...]
pause > nul
if exist "%mypath:~0,-1%\editions.txt" del /f /s /q "%mypath:~0,-1%\editions.txt" > nul
if exist "%mypath:~0,-1%\dpscript.txt" del /f /s /q "%mypath:~0,-1%\dpscript.txt" > nul
if exist "%mypath:~0,-1%\stagenum.wmidat" del /f /s /q "%mypath:~0,-1%\stagenum.wmidat" > nul
if exist "%mypath:~0,-1%\log.wmilog" del /f /s /q "%mypath:~0,-1%\log.wmilog" > nul
wpeutil reboot