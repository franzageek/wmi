# Windows Manual Installer
[![](https://img.shields.io/badge/Go_to-releases-brightgreen?style=plastic&logo=github)](https://github.com/franzageek/wmi/releases) [![](https://img.shields.io/badge/Fork-blue?style=plastic&logo=github)](https://github.com/franzageek/wmi/fork) [![](https://img.shields.io/badge/Report_an_issue-red?style=plastic&logo=github)](https://github.com/franzageek/wmi/issues)

The Batch installer for Windows!

![wmi](https://user-images.githubusercontent.com/88248950/178521169-f7996995-211f-41ba-b08d-e862ad6f7135.png)

[**`Introduction`**](https://github.com/franzageek/wmi#Introduction) - [**`Use`**](https://github.com/franzageek/wmi#Use) - [**`Support`**](https://github.com/franzageek/wmi#Support) - [**`Errors`**](https://github.com/franzageek/wmi#Errors) - [**`Credits`**](https://github.com/franzageek/wmi#Credits)



## Introduction
Windows Manual Installer is an **installer for Windows** written in **Batch**. It runs in 3 stages:
- _**Stage 0**_: The disk gets prepared, the Windows image gets applied and the boot files get created.
- _**Stage 1**_: Begins after the first reboot. WinDeploy sets up drivers and resources, and the user account is setted up.
- _**Stage 2**_: Begins after the second reboot. The Windows Modules Installer gets started, TrustedInstaller sets up your PC and the installation is complete.

After you run WMI, you need to **follow on-screen steps** (for use & installation see [_`Use`_](https://github.com/franzageek/wmi#Use)).

WMI will use **some pre-installed tools**:
- DISKPART to prepare the disk for Windows;
- DISM to apply the Windows image;
- BCDBOOT to create boot files;
- BOOTREC to check if Windows got installed successfully;
- REGEDIT to create some values to install Windows properly;
- NET to create the user account;
- WINDEPLOY to set up drivers & services.

If you encountered any kind of problem, **please [open a issue](https://github.com/franzageek/wmi/issues)**.

And... thats'it! A Batch Windows Installer! (What did you expect from a Batch Windows Installer?!?!) 

## Use
WMI is **very simple & intuitive**. Follow **the guide** and the **WMI on-screen steps** to install Windows correctly.

### Prerequisites
- A computer (or a virtual machine);
- A Windows .ISO file  (you can get this from the Internet);
- One USB stick (or two, depending by how much disks are you using in your computer - don't worry: you will see later) at least of 2 GB;
- A WMI copy downloaded from this repository (you can get it from [here](https://github.com/franzageek/wmi/releases))

#### 1 - Get wmi.bat and copy it on your USB stick
First, you need to **download "wmi.bat"** from [the Releases page](https://github.com/franzageek/wmi/releases).
**Copy it** to your **USB stick**. 

![moveto](https://user-images.githubusercontent.com/88248950/178574998-e0fac62b-c958-4b67-81bb-b7274ee37b90.png)


 > **NOTE**: Windows Installer may assign the letter C: to your USB drive. For WMI to work, the C: letter **needs to be unassigned**: in case of that, take another free USB stick and copy "wmi.bat" on it. The installer will now detect 2 USB sticks: one has got the C: letter and the other one has got another letter. See which one is the C: drive and unplug it. The other USB stick has got another letter that is no longer C: and WMI can continue with the process.
 
 #### 2 - Start Windows installation as normal
 **Turn on your PC** and **start the Windows Installer**. At the language screen, **press `Shift` + `F10`** : this should bring up the **Command Prompt**.
<img width="800" alt="ewmi" src="https://user-images.githubusercontent.com/88248950/178575039-441bb6c4-13df-4c83-88e8-30702a763655.png">

<img width="800" alt="ewmi" src="https://user-images.githubusercontent.com/88248950/178575061-91b56dae-29da-4c0f-b545-abc726488aae.png">

 
 #### 3 - Start WMI
  On the CMD, **start WMI.BAT** by typing its path (in my case is **"e:\wmi.bat"**).
<img width="800" alt="ewmi" src="https://user-images.githubusercontent.com/88248950/178575318-a143f1de-df8f-4656-9459-b90d8c500c19.png">

  
  Press **ENTER**, and you should see **WMI Disclaimer Screen**. Press ENTER again to skip it.
<img width="800" alt="wmiexec" src="https://user-images.githubusercontent.com/88248950/178575346-bef66034-2b6b-4bb4-be2b-d799862cf504.png">

  
  #### 4 - Follow on-screen steps given by WMI
  After you start it, all you need is to **follow on-screen steps** given by WMI.
  
  ### More info about Stages
  
  **Stage 0**: it is the first stage, when you first run WMI from the USB. It prepares the disk using DiskPart, applies the Windows Image using DISM, creates the boot files using BCDBOOT on the boot partition, imports the necessaries hives to the Registry to enable essetial features.
  
  **Stage 1**: it is the second stage. Stage 1 needs to run from the CMD prompt that appears after the first restart, by the C:\ drive. This time, type "C:\wmi.bat" to start WMI. After you run it, WinDeploy sets up services, drivers and resources, and after its completion, you can create your user account. After that, the necessaries Registry keys get created and Stage 1 ends.
  
  **Stage 2**: it is the last stage. It begins after the second reboot. This time you don't have to run WMI from the CMD because it is silently acting in background. It starts Local Session Manager, Windows Modules Installer and sets up your PC with TrustedInstaller. When it's done, you should see the desktop, and the installation is complete. To end completely the Stage 2, you need to run the last time WMI from an elevate CMD, by typing again "c:\wmi.bat". This time, WMI will delete temporary files and itself from the C:\ drive, allowing you to use Windows as you ever did!
  
  ## Support
  WMI works with **multiple Windows versions**:
  | Supported | Y/N | Why |
| ------- | ------------------ | ------------------ |
| Windows 7 | :x: | Windows 7 can detect your USB stick as a dirty volume (this can show Error E0019) (I don't know why). Also, DISM cannot apply WIM images. |
| Windows 8 | :x: | Same as Windows 7, your USB may be detected as dirty and DISM cannot apply any WIM image. |
| Windows 8.1 | :white_check_mark: | Fully supported (there may be graphical glitches due to the small size of the CMD window) |
| Windows 10 | :white_check_mark: | Fully supported |
| Windows 11 | :x: | Windows 11 needs EFI, which is not currently supported by WMI. We will fix this in the next versions. |

## Errors
Here you can find **common errors of WMI**:

### Error Code E0008
 > **ERROR: The C: letter is already taken from another drive! Fix the error, then reboot.**


This error shows up if you're **running WMI from your USB that has been assigned the letter C.** The letter C needs to be **unassigned** for WMI to work.
You can fix this error [this way](https://github.com/franzageek/wmi/#1-get-wmibat-and-copy-it-on-your-usb-stick).

### Error Code E00010
 > **ERROR: Cannot find the installation medium.**


This error shows up if WMI **cannot detect the installation drive.** Try rebooting or change USB stick.

### Error Code E0012
 > **ERROR: The C: letter is taken from the installation drive! Fix the error and reboot.**


This error shows up if the **drive-letter C is already taken by your boot drive**. The letter C needs to be **unassigned** for WMI to work.
You can fix this error only by booting from another source.
  
### Error Code E0019
![e0019](https://user-images.githubusercontent.com/88248950/178575821-2096db7d-b3d9-4f4e-9a95-257bccfa6ec6.gif)

This error shows up as a **blinking text saying "The system cannot find the file specified"** when you try to run WMI. This happens because **WMI cannot read a temporary file stored on the USB, because the drive is detected as a dirty volume**. Try with another USB or try rebooting. 

### Error Code E0021
 > **ERROR: Something went wrong when applying the image.**


This error shows up when **something goes wrong while applying Windows Image**. Try rebooting and starting the program again.

### Error Code E0023
 > **ERROR: Something went wrong when creating boot files.**

This error shows up when **something goes wrong while creating boot files**. Try typing manually the command **"bcdboot C:\Windows /s W: /F ALL"** and then reboot.

### Error Code E0030
 > **To complete Stage 2, please run WMI from an elevated CMD prompt.**


This error shows up when you're **running WMI to complete Stage 2 from a non-elevated CMD prompt.** Try running WMI from an elevated CMD prompt.

If you encountered **any kind of problem, please [open a issue](https://github.com/franzageek/wmi/issues)**.

## Credits

Thanks to Enderman which inspired me to make this software.
Thanks to all the tutorials I watched showing how to use DiskPart to correctly partition the disk.
And thanks to you for reading this!
 

