#include "../include/core.hpp"
#include "../include/rollback.hpp"
#include "../include/reg.hpp"

void wmi_rollback(int interruptCode, int& destDisk)
{
    using namespace std;
    clrscr();
    color("0f");
    system("@title WMI Rollback 0.1.7");
    cout << endl;
    cout << "     ##################################### WMI Rollback v0.1.7 ######################################" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ###        Welcome to WMI Rollback 0.1.7. There seems to be a problem with the setup         ###" << endl;
    cout << "     ###  process. WMI Rollback will revert all the changes made to your disk, in order to make   ###" << endl;
    cout << "     ###                         it ready for a next Windows installation.                        ###" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ###        The specified hard drive will be FULLY FORMATTED and ALL the data on it           ###" << endl;
    cout << "     ###                                  will be LOST forever.                                   ###" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ####################### A WMI dependency - not distributable separately. #######################" << endl;
    cout << endl;
    cout << endl;
    cout << "     [Press any key when ready...]" << endl;
    system("@pause >nul");
    clrscr();
    cout << endl;
    cout << "    [";
    set_line_color(6);
    cout << "****";
    set_line_color(15);
    cout << "] Processing error code..." << endl;
    switch (interruptCode)
    {
        case INT_WIMFILE_NOT_FOUND:
        {
            cout << "    [ ";
            set_line_color(10);
            cout << "OK";
            set_line_color(15);
            cout << " ] The error code has been decoded successfully!" << endl;
            cout << endl;
            set_line_color(12);
            cout << "    FATAL ERROR: ";
            set_line_color(15);
            cout <<                  "Cannot find \"install.wim\"." << endl;
            cout << "                 This is an essential file needed by the Windows Setup," << endl;
            cout << "                 which contains a commpressed Windows image that's meant" << endl;
            cout << "                 to be flashed onto the destination disk." << endl;
            cout << endl;
            cout << "                 The setup process must be halted. Every change made to your disk" << endl;
            cout << "                 will now be reverted." << endl;
            cout << endl;
            cout << "    [Press any key to continue...]";
            system("@pause >nul");
            cout << endl;
            cout << endl;
            cout << "    [";
            set_line_color(6);
            cout << "****";
            set_line_color(15);
            cout << "] Resetting error code..." << endl;
            disk_formatting(destDisk);
            break;
        }
        case INT_DISM_ERROR:
        {
            cout << "    [ ";
            set_line_color(10);
            cout << "OK";
            set_line_color(15);
            cout << " ] The error code has been decoded successfully!" << endl;
            cout << endl;
            set_line_color(12);
            cout << "    ERROR: ";
            set_line_color(15);
            cout <<            "An error occurred while trying to apply the Windows image." << endl;
            cout << endl;
            cout << "           The setup process must be halted. Every change made to your disk" << endl;
            cout << "           will now be reverted." << endl;
            cout << endl;
            cout << "    [Press any key to continue...]";
            system("@pause >nul");
            cout << endl;
            cout << endl;
            cout << "    [";
            set_line_color(6);
            cout << "****";
            set_line_color(15);
            cout << "] Resetting error code..." << endl;
            disk_formatting(destDisk);
            break;
        }
        case INT_INSTALLER_NOT_FOUND:
        {
            cout << "    [ ";
            set_line_color(10);
            cout << "OK";
            set_line_color(15);
            cout << " ] The error code has been decoded successfully!" << endl;
            cout << endl;
            set_line_color(12);
            cout << "    FATAL ERROR: ";
            set_line_color(15);
            cout <<                  "The Windows Live Installer partition has been wiped out." << endl;
            cout << "                 You might've selected the USB installer drive as the" << endl;
            cout << "                 destination drive by mistake, and it may have been formatted." << endl;
            cout << "                 WMI does not have a source from where to install Windows." << endl;
            cout << endl;
            cout << "                 The setup process must be halted. Every change made to your disk" << endl;
            cout << "                 will now be reverted." << endl;
            cout << "                 You'll need to re-create the bootable USB installer." << endl;
            cout << endl;
            cout << "    [Press any key to continue...]";
            system("@pause >nul");
            cout << endl;
            cout << endl;
            cout << "    [";
            set_line_color(6);
            cout << "****";
            set_line_color(15);
            cout << "] Resetting error code..." << endl;
            disk_formatting(destDisk);
            break;
        }
        case INT_INVOKED_FROM_COMMAND_LINE:
        {
            destDisk = NV;
            cout << "    [ ";
            set_line_color(10);
            cout << "OK";
            set_line_color(15);
            cout << " ] The error code has been decoded successfully!" << endl;
            cout << endl;
            cout << "    You started WMI Rollback from the command line." << endl;
            cout << "    Select the disk you want to recover." << endl;
            cout << endl;
            cout << endl;
            disk_selection_menu(destDisk);
            cout << endl;
            cout << endl;
            cout << "    Valid disk detected. You'll now be redirected to the disk formatting process." << endl;
            cout << endl;
            cout << "    [";
            set_line_color(6);
            cout << "****";
            set_line_color(15);
            cout << "] Resetting error code..." << endl;
            disk_formatting(destDisk);
            break;
        }
        case INT_KILLED_BEFORE_END:
        {
            destDisk = NV;
            cout << "    [ ";
            set_line_color(10);
            cout << "OK";
            set_line_color(15);
            cout << " ] The error code has been decoded successfully!" << endl;
            cout << endl;
            cout << "    It seems that the WMI setup process has been killed before the end." << endl;
            cout << "    The disk needs to be formatted in order to be ready again." << endl;
            cout << endl;
            cout << endl;
            disk_selection_menu(destDisk);
            cout << endl;
            cout << endl;
            cout << "    [";
            set_line_color(6);
            cout << "****";
            set_line_color(15);
            cout << "] Resetting error code..." << endl;
            disk_formatting(destDisk);
            break;
        }
    }
    clrscr();
    cout << endl;
    cout << "     ##################################### WMI Rollback v0.1.7 ######################################" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ###              Congrats, you've finally reached the end of the rollback phase!             ###" << endl;
    cout << "     ###                    Your disk should now be ready for a new installation.                 ###" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ###                         Please press any key to reboot your PC.                          ###" << endl;
    cout << "     ###                                                                                          ###" << endl;
    cout << "     ####################### A WMI dependency - not distributable separately. #######################" << endl;
    cout << endl;
    cout << endl;
    cout << "     [Press any key to reboot your PC...]" << endl;
    getch();
    if (filesystem::exists(filesPath + "\\dpscript.txt"))
    {
        filesystem::remove_all(filesPath + "\\dpscript.txt"); //Files cleanup
    }
    if (filesystem::exists(filesPath + "\\dpout.txt"))
    {
        filesystem::remove_all(filesPath + "\\dpout.txt");
    }
    if (filesystem::exists(filesPath + "\\dism.txt"))
    {
        filesystem::remove_all(filesPath + "\\dism.txt");
    }
    if (filesystem::exists(filesPath + "\\dismexec.bat"))
    {
        filesystem::remove_all(filesPath + "\\dismexec.bat"); //Files cleanup
    }
    reg_delete_value(WMIKey, "Stage");
    reg_delete_value(WMIKey, "KilledBeforeEnd");
    reg_delete_key(WMIKey);
    system("@wpeutil reboot");
}

void disk_selection_menu(int& disk)
{
    using namespace std;
    cout << endl;
    cout << "    Locate the number corresponding to the disk you want to recover:" << endl;
    cout << endl;
    system(("@echo lis dis > \""+ filesPath + "\\dpscript.txt\"").c_str()); //Create the script file for DiskPart
    system(("diskpart /s \""+ filesPath + "\\dpscript.txt\" > \""+ filesPath + "\\dpout.txt\"").c_str()); //Make DiskPart execute the script file while printing the output to a temporary text file
    ifstream dpout(filesPath + "\\dpout.txt"); //Needed to display a cleaner disk table
    string currentLine;
    for (int i = 0; i <= 5; i++) 
    {
        getline(dpout, currentLine); //Skip DiskPart info lines
    }
    while (getline(dpout, currentLine)) 
    {
        cout << "                   " << currentLine << endl; //Display the disk table only, line by line
    }
    dpout.close();
    std::filesystem::remove_all(filesPath + "\\dpout.txt"); //Remove the script file
    system(("@FOR /F \"tokens=2\" %a IN ('diskpart /s " + filesPath + "\\dpscript.txt') DO @echo %a>>" + filesPath + "\\dpout.txt").c_str()); //Write 2nd token of DiskPart output into a file 
    system("@chcp 850 >nul");
enterDiskNumber:
    ifstream diskNum(filesPath + "\\dpout.txt");
    for (int i = 0; i < 5; i++) 
    {
        getline(diskNum, currentLine); //Skip 5 lines
    }
    cout << endl;
    cout << "    Type the number (just the number) corresponding to the disk you want to recover: ";
    char input = ' ';
    input = getch(); //Get disk number from user input
    cout << input;
    while (getline(diskNum, currentLine))
    {
        if (isdigit(input)) 
        {
            disk = char_to_int(input);
            if (to_string(disk) == currentLine) //If input is equal to line then jump
            {
                goto proceedWithFormatting; 
            }
        }
    }
    diskNum.close();
    cout << "\n    The disk number is not valid." << endl;
    goto enterDiskNumber; //Jump back
proceedWithFormatting:
    cout << "\n\n    Press SPACE to confirm your choice, press any other key to discard it..."; //Wait for user confirmation
    input = ' ';
    input = getch();
    if (input != ' ')
    {
        cout << endl;
        diskNum.close();
        goto enterDiskNumber;
    }
    diskNum.close();
    std::filesystem::remove_all(filesPath + "\\dpout.txt");
    system("@chcp 65001 >nul");
    return;
}

void disk_formatting(int disk)
{
    using namespace std;
    cout << "    [ ";
    set_line_color(10);
    cout << "OK";
    set_line_color(15);
    cout << " ] The error code has been decoded successfully!" << endl << endl;
    cout << "    [";
    set_line_color(6);
    cout << "****";
    set_line_color(15);
    cout << "] Formatting the disk..." << endl;
    cout << endl;
    cout << "    This may take some time, depending on the size/speed of the disk." << endl;
    set_line_color(6);
    cout << "    WARNING: DO NOT ";
    set_line_color(15);
    cout << "close this window ";
    set_line_color(6);
    cout << "OR ";
    set_line_color(15);
    cout << "cancel the formatting process,\n    this will ";
    set_line_color(12);
    cout << "CORRUPT ";
    set_line_color(15);
    cout << "your drive ";
    set_line_color(12);
    cout << "PERMANENTLY." << endl;
    set_line_color(15);
diskCheck:
    while (disk == NV)
    {
        cout << endl;
        cout << "    [";
        set_line_color(12);
        cout << "FAIL";
        set_line_color(15);
        cout << "] The specified disk is not valid. Please select a disk to recover." << endl;
        disk_selection_menu(disk);
    }
    for (int i = 0; i < 10; i++) //Just making sure the current destDisk value is likely a valid disk.
    {
        if (disk == i)
        {
            goto formatDisk;
        }
    }
    disk = NV;
    goto diskCheck;
formatDisk:
    if (!uefiFirmware)
    {
        system(("@echo sel dis " + to_string(disk) + " > " + filesPath + "\\dpscript.txt").c_str()); //Execute DiskPart commands, one by one, to format the selected drive in the right way
        system(("@echo clean >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo conv mbr >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo cre par pri >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo for fs=exfat quick >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo exit  >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@diskpart /s \""+ filesPath + "\\dpscript.txt\" >nul").c_str());
    }
    else
    {
        system(("@echo sel dis " + to_string(disk) + " > " + filesPath + "\\dpscript.txt").c_str()); //Execute DiskPart commands, one by one, to format the selected drive in the right way
        system(("@echo clean >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo conv gpt >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo cre par pri >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo for fs=ntfs quick >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@echo exit  >> " + filesPath + "\\dpscript.txt").c_str());
        system(("@diskpart /s \""+ filesPath + "\\dpscript.txt\" >nul").c_str());
    }
    
    if (std::filesystem::exists(filesPath + "\\dpscript.txt"))
    {
        std::filesystem::remove_all(filesPath + "\\dpscript.txt"); //Files cleanup
    }
    if (std::filesystem::exists(filesPath + "\\dpout.txt"))
    {
        std::filesystem::remove_all(filesPath + "\\dpout.txt");
    }
    cout << endl;
    cout << "    [ ";
    set_line_color(10);
    cout << "OK";
    set_line_color(15);
    cout << " ] The disk has been successfully formatted." << endl;
    return;
}