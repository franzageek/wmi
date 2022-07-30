@echo off
cd /d "%~dp0"
set mypath=%~dp0
:beginning
set /p _stagex=<"%mypath:~0,-1%\stagenum.wmidat"
if "%_stagex%"=="" (
	echo 0 >"%mypath:~0,-1%\stagenum.wmidat"
	cls 
	goto :beginning
)
set _stage=%_stagex:~0,-1%
::"%mypath:~0,-1\"
title Windows Manual Installer 0.1 UEFI Edition - Stage %_stage%
cls
echo.
echo    *************************************
echo    *      Windows Manual Installer     *
echo    *          [ UEFI EDITION ]         *
echo    *            Version 0.1            *
echo    *     Developed by  ^<franzageek^>    *
echo    *************************************
pause
cls
echo.
echo    *************************************
echo    *      Windows Manual Installer     *
echo    *          [ UEFI EDITION ]         *
echo    *            Version 0.1            *
echo    *     Developed by  ^<franzageek^>    *
echo    *************************************
echo.
echo    *************************************
echo    * This program is meant to be used  *
echo    *    to manually install Windows.   *
echo    *     For further details visit:    *
echo    * https://github.com/franzageek/wmi *
echo    *************************************
pause
cls
echo.
echo    *************************************
echo    *      Windows Manual Installer     *
echo    *          [ UEFI EDITION ]         *
echo    *            Version 0.1            *
echo    *     Developed by  ^<franzageek^>    *
echo    *************************************
echo.
echo    *************************************
echo    * This program is meant to be used  *
echo    *    to manually install Windows.   *
echo    *     For further details visit:    *
echo    * https://github.com/franzageek/wmi *
echo    *************************************
echo.
echo    *************************************
echo    * The code is licensed to you under *
echo    *    the terms of the MIT License,  *
echo    *   and this program comes with no  *
echo    *      warranty at all. I'm not     *
echo    *   the responsible for any damage  *
echo    *   that may be caused to your PC.  *
echo    *      Use WMI at your own risk.    *
echo    *************************************
pause
cls
echo.
echo    *************************************
echo    *      Windows Manual Installer     *
echo    *          [ UEFI EDITION ]         *
echo    *            Version 0.1            *
echo    *     Developed by  ^<franzageek^>    *
echo    *************************************
echo.
echo    *************************************
echo    * This program is meant to be used  *
echo    *    to manually install Windows.   *
echo    *     For further details visit:    *
echo    * https://github.com/franzageek/wmi *
echo    *************************************

echo.
echo    *************************************
echo    * The code is licensed to you under *
echo    *    the terms of the MIT License,  *
echo    *   and this program comes with no  *
echo    *      warranty at all. I'm not     *
echo    *   the responsible for any damage  *
echo    *   that may be caused to your PC.  *
echo    *      Use WMI at your own risk.    *
echo    *************************************
echo.
echo    *************************************
echo    * This program is going to use:     *
echo    *       - DISKPART                  *
echo    *       - DISM                      *
echo    *       - BCDBOOT                   *
echo    *       - REGEDIT                   *
echo    *       - NET                       *
echo    *       - WINDEPLOY                 *
echo    *************************************
pause
cls
echo.
echo    *************************************
echo    *      Windows Manual Installer     *
echo    *          [ UEFI EDITION ]         *
echo    *            Version 0.1            *
echo    *     Developed by  ^<franzageek^>    *
echo    *************************************
echo.
echo    *************************************
echo    * This program is meant to be used  *
echo    *    to manually install Windows.   *
echo    *     For further details visit:    *
echo    * https://github.com/franzageek/wmi *
echo    *************************************
echo.
echo    *************************************
echo    * The code is licensed to you under *
echo    *    the terms of the MIT License,  *
echo    *   and this program comes with no  *
echo    *      warranty at all. I'm not     *
echo    *   the responsible for any damage  *
echo    *   that may be caused to your PC.  *
echo    *      Use WMI at your own risk.    *
echo    *************************************
echo.
echo    *************************************
echo    * This program is going to use:     *
echo    *       - DISKPART                  *
echo    *       - DISM                      *
echo    *       - BCDBOOT                   *
echo    *       - REGEDIT                   *
echo    *       - NET                       *
echo    *       - WINDEPLOY                 *
echo    *************************************
echo.
echo    ******************************************
echo    *   The program will run in 3 stages:    *
echo    *   - Stage 0: The first stage, where    *
echo    *              the disk get prepared,    *
echo    *              where the boot files      *
echo    *              get created and where     *
echo    *              the Windows Image gets    *
echo    *              applied;                  *
echo    *   - Stage 1: After the first reboot,   *
echo    *              WinDeploy gets started,   *
echo    *              and the user account      *
echo    *              is setted up.             *
echo    *   - Stage 2: After the second reboot,  *
echo    *              the Windows Modules       *
echo    *              Installer gets started,   *
echo    *              and the installation is   *
echo    *              complete.                 *
echo    *                                        *
echo    *  If this is the first time you run WMI *
echo    *       you are probably in Stage 0.     *
echo    * When each stage is completed, you will *
echo    *          be prompted by WMI.           *
echo    *  After each restart, all you need is   *
echo    * just run again WMI from your USB drive *
echo    * and it will automatically detect which *
echo    *      stage needs to be started.        *
echo    ******************************************
echo.
echo # PRESS ENTER WHEN READY... 
pause > nul
if "%_stage%"=="0" goto :stage0
if "%_stage%"=="1" goto :stage1
if "%_stage%"=="2" goto :stage2
echo An error occurred^^! please try to reboot your PC.
pause > nul
exit


:stage0
cls 
echo Checking installation disk...
set /a att_times=0
	:detect_drive
	set /a att_times=%att_times%+1
	if %att_times%==16 (
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
	echo Done.
	echo Checking WMI launch point...
	if "%~dp0"=="C:\" (
		echo [ERROR]: The C: letter is already taken from another drive^^! Fix the error, then reboot.
		echo          [TESTED, WORKING: You can fix the error by connecting 2 USBs, both with WMI in, start it
		echo           from the one that is not a C: drive and then unplug the other one.]
		pause
		exit
	)
	if "%installdrive%"=="C" (
		echo [ERROR]: The C: letter is taken from the installation drive^^! Fix the error and reboot.
		echo          [You can fix the error by booting from a CD or a DVD if you can.]
	)
	
	echo OK, found the installation drive and set the INSTALL.WIM path, proceeding...
	echo Starting DiskPart [DO NOT TOUCH THE KEYBOARD: the commands will be executed automatically]...
	(echo lis dis
	echo exit
	)  | diskpart 
	:tempbookmark0
	set /p destdisk=Enter the number [only the number] of the disk [disks are listed above] where you want to install Windows on:
	if "%destdisk%"=="" (
		goto :tempbookmark0
	)
	(echo sel dis %destdisk%
	echo conv gpt
	echo cre par efi size=500
	echo for fs=fat32
	echo ass letter W
	echo cre par pri
	echo for fs=ntfs quick
	echo ass letter C
	exit
	)  | diskpart 
	echo.
	echo Disk successfully prepared, proceeding...
	goto :afterdp
	
	:afterdp
	cls
	cd /d %installdrive%:\sources
	echo.
	echo.
	echo Disk successfully prepared, proceeding...
	echo.
	echo Now, we're gonna apply the Windows image to your disk, but first you have to choose the edition.
	echo When you'll press ENTER, it will be listed a long list of edition.
	echo Choose your favourite, read the INDEX value and type it below.
	echo.
	echo ### EXAMPLE: 
	echo.
	echo     Index : 1
	echo     Name  : Windows 11 Home
	echo Description : Windows 11 Home
	echo     Size  : [size in bytes]
	echo.
	echo     Index : 2
	echo     Name  : Windows 11 Pro
	echo Description : Windows 11 Pro
	echo     Size  : [size in bytes]
	echo.
	echo So if you want to install Windows 11 Home, the index number will be 1.
	echo However, for Windows 11 Pro, the index number is 2.
	echo [this is only an example.]
	echo.
	echo Now, press ENTER to display the editions for your ISO file...
	pause > nul
	dism /get-wiminfo /wimfile:%installfile%
	echo.
	echo Enter below the index number for your editon [only the number, no spaces].
	:tempbookmark1
	set /p indexvalue=Index:
	if "%indexvalue%"=="" goto :tempbookmark1
	echo.
	echo Perfect^^! Now you need to wait from 5 to 20 minutes until the Windows image is fully installed.
	echo Don't worry^^! Here you'll see a progress bar, that will show the process activity.
	echo If the system seems frozen, don't worry: wait the end of the process.
	echo This will take several minutes...
	dism /apply-image /imagefile:%installfile% /index:%indexvalue% /applydir:C:\
	echo Done^^!
	echo Creating boot files...
	bcdboot C:\Windows /s W: /F UEFI
	echo Updating Registry Settings...
	echo Loading "SOFT" hive...
	reg load "HKLM\SOFT" "C:\Windows\System32\config\SOFTWARE"
	echo Loading "SYS" hive...
	reg load "HKLM\SYS" "C:\Windows\System32\config\SYSTEM"
	echo Adding Verbose Status...
	reg add "HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /f /t REG_DWORD /d "1"
	echo Disabling Cursor Suppression...
	reg add "HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /f /t REG_DWORD /d "0"
	echo Adding CMDLINE...
	reg add "HKLM\SYS\Setup" /v "CmdLine" /f /t REG_SZ /d "cmd.exe"
	goto :end_stage0
	
	:end_stage0
	cls 
	color 0b
	echo.
	echo                               ### READ CAREFULLY ###
	echo.
	echo           ********************************************************************
	echo           *  You completed Stage 0 of WMI. Now, remove the installation      *
	echo           *  media and press ENTER to reboot your PC. At the boot, you       *
	echo           *  should see a CMD window. Launch again WMI from that window.     *
	echo           *  NOTE: WMI is no longer located on your USB drive, but is now    *
	echo           *  located on the C:\ drive. To launch it, simply type on the CMD  *
	echo           *  prompt "c:\wmi.bat". The WMI copy on your USB drive is gonna    *
	echo           *  be reset in order not to cause filename conflicts while         *
	echo           *  running WMI.                                                    *                                     
	echo           *                                                                  *
	echo           *  WMI will automatically start the Stage 1, after the Disclaimer  *
	echo           *  screen. See you on the other side^^!                              *
	echo           ********************************************************************
	echo.
	echo Remove the installation media, then press ENTER...
	pause > nul
	echo.
	echo Rebooting Windows...
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
CLS 
echo Setting up drivers and services, this will take some time...
cd /d C:\Windows\System32\
oobe\windeploy
echo.
:tempbookmark2
set /p untbc=[NO SPACES] Enter your username [password is not available, but you'll be able to set it later]:
if /i "%untbc%"=="" goto :tempbookmark2
if /i "%untbc%"=="con" set untbc=User
if /i "%untbc%"=="aux" set untbc=User
if /i "%untbc%"=="nul" set untbc=User
echo.
echo Don't be worried of the error below: it's ok^!
echo.
net user /add "%untbc%"
net localgroup /add users "%untbc%"
net localgroup /add administrators "%untbc%"
echo Username "%untbc%" set, proceeding...
echo Updating Registry Settings once again...
echo Updating "OOBEInProgress"...
reg add "HKLM\SYSTEM\Setup" /v "OOBEInProgress" /f /t REG_DWORD /d "0"
echo Updating "SetupType"...
reg add "HKLM\SYSTEM\Setup" /v "SetupType" /f /t REG_DWORD /d "0"
echo Updating "SystemSetupInProgress"...
reg add "HKLM\SYSTEM\Setup" /v "SystemSetupInProgress" /f /t REG_DWORD /d "0"
echo.
goto :end_stage1

	:end_stage1
	cls 
	color 0b
	echo.
	echo                               ### READ CAREFULLY ###
	echo.
	echo           ********************************************************************
	echo           *  You completed Stage 1 of WMI. Press ENTER to start Stage 2.     *
	echo           *  After you hit ENTER, wait about 40 seconds and the PC will      *
	echo           *  restart. Once the PC is restarted, you should see the blue      *
	echo           *  loading screen, that says "Please wait for TrustedInstaller"    *
	echo           *  and then "Please wait for Windows Modules Installer" or         *
	echo           *  something like that. This is the sign that you're currently in  *
	echo           *  Stage 2. Wait for the restart, and then you should see the      *
	echo           *  lockscreen with your user account. Log in and then wait until   *
	echo           *  the end of the prepairing process. Next, you have to set up     *
	echo           *  privacy settings. After that, you're good to go^! When you're    *
	echo           *  logged in [when you can see the desktop] run WMI another time   *
	echo           *  [run it typing "c:\wmi.bat" on the CMD. Run it to clean up the  *
	echo           *  environment and to view the Credits screen].                    *
	echo           *                                                                  *
	echo           *  Then, you can use Windows as you ever did^!                      *
	echo           ********************************************************************
	echo.
	echo Press ENTER to get into Stage 2...
	pause > nul
	color
	echo 2 >"%mypath:~0,-1%\stagenum.wmidat"
	exit








:stage2
CLS 
net session >nul 2>&1
if %errorlevel%==0 (
	goto :s2end
) else (
	echo To complete Stage 2, please run WMI from an elevated CMD prompt.
	exit /b
) 
:s2end
CLS 
echo Cleaning up the environment, please wait...
cd /d "%mypath%"
if exist "stagenum.wmidat" del /f /s /q "stagenum.wmidat" > nul
title Windows Manual Installer 0.1 UEFI Edition - End
echo Done.
cls
echo.
echo           ********************************************************************
echo           *  Thank you for choosing to use WMI! We hope we have done a good  *
echo           *  job.                                                            *
echo           *  If you encountered any kind of problem, please open a issue     *
echo           *  at "github.com/franzageek/wmi/issues" and we will try to fix it *
echo           *  as soon as possible.                                            *
echo           *                                                                  *
echo           *                                                                  *
echo           *  Windows Manual Installer version 0.1 for UEFI systems           *
echo           *  Developed by ^<franzageek^>                                       *
echo           *                                                                  *
echo           *               github.com/franzageek                              *
echo           *               youtube.com/c/FranzaGeek                           *
echo           *                                                                  *
echo           *  [feel free to follow if you want!]                              *
echo           *                                                                  *
echo           *  Copyright [c] FranzaGeek 2021-2022. All rights are reserved.    *
echo           *                                                                  *
echo           ********************************************************************
echo.
echo Press ENTER to exit...
pause > nul
(goto) 2>nul & del "%~f0"
exit

