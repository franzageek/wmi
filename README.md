# Windows Manual Installer
[![](https://img.shields.io/badge/Go_to-releases-brightgreen?style=plastic&logo=github)](https://github.com/franzageek/wmi/releases) [![](https://img.shields.io/badge/Fork-blue?style=plastic&logo=github)](https://github.com/franzageek/wmi/fork) [![](https://img.shields.io/badge/Report_an_issue-red?style=plastic&logo=github)](https://github.com/franzageek/wmi/issues) [![](https://img.shields.io/badge/Share_Feedback-turquoise?style=plastic)](https://github.com/franzageek/wmi/discussions/2)

The Batch installer for Windows!

![wmi](https://user-images.githubusercontent.com/88248950/178521169-f7996995-211f-41ba-b08d-e862ad6f7135.png)

[**`Introduction`**](https://github.com/franzageek/wmi#introduction) - [**`Use`**](https://github.com/franzageek/wmi#use) - [**`Support`**](https://github.com/franzageek/wmi#support) - [**`Errors`**](https://github.com/franzageek/wmi#errors) - [**`[NEW!] WMI Rollback`**](https://github.com/franzageek/wmi#wmi-rollback) - [**`Download`**](https://github.com/franzageek/wmi#Downloads) - [**`Credits`**](https://github.com/franzageek/wmi#credits)



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

And... that's it! A Batch Windows Installer! (What did you expect from a Batch Windows Installer?!?!) 

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
  On the CMD, **start WMI.BAT** by typing its path (in my case it's **"e:\wmi.bat"**).
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
| Windows 8.1 | :white_check_mark: | Fully supported (there may be graphical glitches due to the small size of the CMD window). |
| Windows 10 | :white_check_mark: | Fully supported. |
| Windows 11 | :white_check_mark: | Supported by WMI-UEFI version. (Download it [here](https://github.com/franzageek/wmi/releases).)

## Errors

I recently moved this section to [WMI's Wiki](https://github.com/franzageek/wmi/wiki).

You can find the Help Section [here](https://github.com/franzageek/wmi/wiki/Help-&-error-troubleshooting).

If you encountered **any kind of problem, please [open a issue](https://github.com/franzageek/wmi/issues)**.

## WMI Rollback
> A WMI dependency - not distributable separately.

![wrb](https://user-images.githubusercontent.com/88248950/194742841-e05a3e21-a499-4615-bd45-7915a7f16171.png)

> **_NOTE_**: After using WMI UEFI 0.1.5, as well as its previous version, you cannot install Windows using WMI UEFI due to unknown bugs. We suggest you to use the default installer to install Windows from scratch. We will try to fix the problem as soon as possible. Sorry for the inconvenience.

From WMI 0.2.0 onwards, WMI will have a recovery procedure to start whenever needed.
If an error occurs, WMI will start the rollback procedure, which will reset the disk by canceling all the changes made to it.
This way, the drive can be used again without any problem.
It detects the problem and it automatically starts the rollback phase.
It formats the drive you selected earlier using NTFS and makes it ready for a next usage.
This way, if WMI encounters any error, WMI Rollback will kick in, reverting all the changes made to the disk.

You can find WMI Rollback embedded with WMI 0.2.0 or later.

### Changelog
`0.1.0`: First version of WMI Rollback (Download WMI 0.2.0: [BIOS](github.com/franzageek/releases/tag/0.2.0)/[UEFI](github.com/franzageek/releases/tag/uefi-0.2.0))
`0.1.5`: Second version of WMI Rollback (Download WMI 0.2.2: [BIOS](github.com/franzageek/releases/tag/0.2.2)/[UEFI](github.com/franzageek/releases/tag/uefi-0.2.2))

## Downloads
Since the [Releases page](https://github.com/franzageek/wmi/releases) is a little messed up, here you can find all the downloads for WMI.

**BIOS**

[**`→ v0.1`**](https://github.com/franzageek/wmi/releases/tag/0.1)
[**`→ v0.1.2`**](https://github.com/franzageek/wmi/releases/tag/0.1.2)
[**`→ v0.1.3`**](https://github.com/franzageek/wmi/releases/tag/0.1.3)
[**`→ v0.1.6`**](https://github.com/franzageek/wmi/releases/tag/0.1.6)
[**`→ v0.2.0`**](https://github.com/franzageek/wmi/releases/tag/0.2.0)
[**`→ v0.2.2`**](https://github.com/franzageek/wmi/releases/tag/0.2.2)

**UEFI**

[**`→ v0.1`**](https://github.com/franzageek/wmi/releases/tag/uefi-0.1)
[**`→ v0.1.2`**](https://github.com/franzageek/wmi/releases/tag/uefi-0.1.2)
[**`→ v0.1.3`**](https://github.com/franzageek/wmi/releases/tag/uefi-0.1.3)
[**`→ v0.1.6`**](https://github.com/franzageek/wmi/releases/tag/uefi-0.1.6)
[**`→ v0.2.0`**](https://github.com/franzageek/wmi/releases/tag/uefi-0.2.0)
[**`→ v0.2.2`**](https://github.com/franzageek/wmi/releases/tag/uefi-0.2.2)


## Credits

Thanks to Enderman which inspired me to make this software.
Thanks to all the tutorials I watched showing how to use DiskPart to correctly partition the disk.
And thanks to you for reading this!
 

