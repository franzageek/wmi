# Windows Manual Installer

Install Windows the unintended way

![wmi](https://user-images.githubusercontent.com/88248950/178521169-f7996995-211f-41ba-b08d-e862ad6f7135.png)

[![](https://img.shields.io/badge/Go_to-releases-brightgreen?style=for-the-badge&logo=github)](https://github.com/franzageek/wmi/releases) [![](https://img.shields.io/badge/Fork-blue?style=for-the-badge&logo=github)](https://github.com/franzageek/wmi/fork) [![](https://img.shields.io/badge/Report_an_issue-red?style=for-the-badge&logo=github)](https://github.com/franzageek/wmi/issues)

**<kbd>[Introduction](https://github.com/franzageek/wmi#introduction)</kbd>** - **<kbd>[How to build](https://github.com/franzageek/wmi#how-to-build)</kbd>** - **<kbd>[Support](https://github.com/franzageek/wmi#support)</kbd>** - **<kbd>[Credits](https://github.com/franzageek/wmi#credits)</kbd>**

## 

## Introduction

Windows Manual Installer is an open C++ **installer program** that allows you to **install Windows** like the default installer.

It's actually **faster** than the default one!

WMI's job is split up into **3 stages**:

- ***Stage 0***: It covers the phase you'd normally go through when first booting a Windows ISO image off of an USB. During Stage 0 the disk gets properly formatted, the Windows image gets extracted onto the hard drive and the boot config files get created.

- ***Stage 1***:  It begins after the first reboot. WinDeploy is run to properly set up drivers & services and the user account is set up.

- ***Stage 2***: The PC is rebooted one last time, after which TrustedInstaller completes the installation procedure.

WMI is really **straightforward** and **very easy** to get on with.

You just need to follow a couple of on screen steps, and you're pretty much done (for further usage information, please see the [Usage page](https://github.com/franzageek/wmi/wiki/3.-User-guide) of [WMI's wiki](https://github.com/franzageek/wmi/wiki)).

## How to build

You first need to download the source code.

Place it somewhere easy to reach and work with.

This is the full directory tree:

```bash
code-root/
    |_ bin/
    |    |_ wmi.exe //This will be the output executable
    |
    |_ deps/
    |    |_ dlls/ //Contains some DLLs needed to run WMI from Windows PE
    |    |    |_ libgcc_s_seh-1.dll
    |    |    |_ libstdc++-6.dll
    |    |    |_ libwinpthread-1.dll
    |    |    
    |    |_ WMIFILES/ //Contains files that are needed by WMI
    |         |_ COPYING //Copyright notice
    |         |_ fullscr.vbs
    |         |_ MAS_AIO.bat
    |         |_ wpu.bat
    |     
    |_ include/ //Contains header files 
    |    |_ core.hpp //Main header file
    |    |_ reg.hpp
    |    |_ rollback.hpp
    |
    |_ src/ //Contains actual source files
    |    |_ main.cpp
    |    |_ core.cpp
    |    |_ reg.cpp
    |    |_ rollback.cpp
    |
    |_ Makefile
```

To build WMI, you first need to open a terminal window in the root directory.

- To build the `wmi.exe` executable, you can execute this command:

```bash
$ make
```

> It will re-generate the executable only, which will be output in the `bin/` folder.

- To make WMI ready for use, you can execute this command:

```bash
$ make install
```

> An `install/` folder will be created. It will contain every file needed for WMI to work.

After running `make install`, you can just copy the content of the `install/` folder and put it in the root of a common USB drive.

- If you want to remove the files left by previous compilations, you can always run:

```bash
$ make clean
```

> You'll then be ready to build WMI again from scratch.

Or alternatively, you can just download the [prebuilt zip](https://github.com/franzageek/wmi/releases/latest).

## Support

If you need specific technical support, you can always visit the [wiki](https://github.com/franzageek/wmi/wiki) section of this repo. It's got pretty detailed descriptions on basically everything you may want to know about WMI.

And if you've experienced any kind of problem while using WMI, I'd be very thankful if you could [open an issue](https://github.com/franzageek/wmi/issues).

## Credits

Thanks to [Endermanch](https://www.youtube.com/@Endermanch) who was the first ever person which inspired me to start working on this awesome project. His videos where he gets to Windows' insides, fucks around with the system and tries to break everything are INSANE!

Thanks to [massgravel](https://github.com/massgravel) for letting me use his [Microsoft Activation Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts) project.


