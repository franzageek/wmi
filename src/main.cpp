#include "../include/core.hpp"
#include "../include/reg.hpp"
#include "../include/rollback.hpp"

int main(int argc, char *argv[])
{
    using namespace std;
    using namespace std::filesystem;
    using namespace std::literals;

    #pragma region WMI Bootstrapping process 

    system("@chcp 65001 > nul");
    system("@mode 120, 30 >nul");
    system(("@call \"" + filesPath + "\\fullscr.vbs" + "\"").c_str()); //Make the window fullscreen
    color("0f");
    clrscr();
    system(("@title Windows Manual Installer v" + ver).c_str());
    cout << endl;
    cout << endl;
    cout << "     WMI v" << ver << " (ce012248c55fa133accfffcf45047606, 0d160255)" << endl;
    cout << "     " << endl;
    cout << "     Copyright 2020,2024   <franzageek>" << endl;
    cout << "     Copyright 2022,2024   Windows Manual Installer" << endl;
    cout << "     Copyright 2019,2023   MASSGRAVE" << endl;
    cout << "     Copyright 2019,2023   Microsoft Activation Scripts" << endl;
    cout << endl;
    cout << "     This code is licensed to you under the terms of the" << endl;
    cout << "     MIT license, for further details see file COPYING." << endl;
    cout << "     Please wait until WMI is done bootstrapping." << endl;
    cout << endl;
    cout << endl;
    cout << "     Cleaning up environment...";
    while (exists(filesPath + "\\dism.txt")) //Old files cleanup
    {
        remove_all(filesPath + "\\dism.txt");
    }
    while (exists(filesPath + "\\dpscript.txt"))
    {
        remove_all(filesPath + "\\dpscript.txt");
    }
    cout << "done." << endl;
    cout << "     Retrieving current Stage data...";
    get_window_size(windowColumns, windowRows);
    char ComputerName [MAX_COMPUTERNAME_LENGTH +1];
    DWORD cbComputerName = sizeof(ComputerName);
    if (GetComputerNameA(ComputerName, &cbComputerName))
    {
        if (ComputerName != "MINWINPC"sv)
        {
            cout << "done, proceeding." << endl;
            set_line_color(12);
            cout << "     Error";
            set_line_color(15);
            cout << ": You're not running WMI from within Windows PE." << endl;
            cout << endl << "     Press any key to exit...";
            system("@pause >nul");
            system(("@call \"" + filesPath + "\\fullscr.vbs" + "\"").c_str());
            reg_delete_key(WMIKey);
            clrscr();
            exit(-1);
        }
    }
    if (reg_query_value("SYSTEM\\CurrentControlSet\\Control\\SecureBoot\\State", "UEFISecureBootEnabled")) //If key exists, firmware type is UEFI
    {
        uefiFirmware = false;
    }
    else
    {
        uefiFirmware = true;
    }
    string stage;
    string cmdLine;
    int ctr = 0;
    reg_get_value("SYSTEM\\Setup", "CmdLine", cmdLine);
    if (cmdLine == "cmd.exe /k C:\\wmi.exe") //If key exists, Stage is 1
    {
        stage = "1";
        goto stageIsSet;
    }
    while (reg_query_value(WMIKey, "Stage") == err) //Search for the "Stage" value stored in the Windows Registry
    {
        if (ctr == 20)
        {
            cout << "failed." << endl;
            set_line_color(12);
            cout << "     Error";
            set_line_color(15);
            cout << ": You need to run WMI with admin privileges." << endl;
            cout << endl << "     Press any key to exit...";
            system("@pause >nul");
            system(("@call \"" + filesPath + "\\fullscr.vbs" + "\"").c_str());
            clrscr();
            exit(-1);
        }
        reg_create_key(WMIKey);
        reg_create_value(WMIKey, "0", "Stage"); //If not found, create the key and the value
        ctr++;
    }
    reg_get_value(WMIKey, "Stage", stage); //Retrieve current Stage number
    if (stage == "0") {
        if(reg_query_value(WMIKey, "KilledBeforeEnd") == err)
        {
            reg_create_value(WMIKey, "True", "KilledBeforeEnd"); //Check if WMI was killed unexpectedly
        }
        else
        {
            cout << "done." << endl;
            cout << "     Loading WMI Rollback...";
            system("(echo exit) | diskpart >nul");
            cout << "done, proceeding." << endl;
            cout << endl << "     Press any key to begin...";
            system("@pause >nul");
            wmi_rollback(INT_KILLED_BEFORE_END, destDisk); //If stage is zero and "KilledBeforeEnd" key exists, start WMI Rollback
        }
    }

stageIsSet:
    if (argc >= 2)
    {
        if (argv[1] == "/rollback"sv || argv[1] == "-rb"sv) 
        {
            if (stage == "0") //If WMI Rollback was called from the command line && current Stage is 0, call WMI Rollback
            {
                cout << "done." << endl;
                cout << "     Loading WMI Rollback...";
                system("(echo exit) | diskpart >nul");
                cout << "done, proceeding." << endl;
                cout << endl << "     Press any key to begin...";
                system("@pause >nul");
                wmi_rollback(INT_INVOKED_FROM_COMMAND_LINE, destDisk); 
            }
        }
        else //If command line argument is different from the above options, throw an error and exit
        {
            cout << "done, proceeding." << endl;
            set_line_color(12);
            cout << "     Error";
            set_line_color(15);
            cout << ": \"" << argv[1] << "\" is not a recognized argument." << endl;
            cout << endl << "     Press any key to exit...";
            system("@pause >nul");
            system(("@call \"" + filesPath + "\\fullscr.vbs" + "\"").c_str());
            reg_delete_key(WMIKey);
            clrscr();
            exit(-1);
        }
    }
    
    cout << "done, proceeding." << endl;

    #pragma endregion WMI Bootstrapping process
    
    string chr="═";
    string header = ""; //Set graphic elements of the TUI
    for (int i = 0; i < windowColumns; i++)
    {
        header = header + chr;
    }
    cout << endl << "     Press any key to begin...";
    system("@pause >nul");
    clrscr();
    system(("@title Windows Manual Installer v" + ver + " - Stage " + stage).c_str());
    cout << endl;
    cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
    cout << endl;
    cout << header << endl;
    cout << endl;
    cout << endl;
    cout << "             ███        ███        ███     ████       ████               ███                                                 " << endl;
    cout << "            █████      █████      █████   ██████     ██████             █████     Windows Manual Installer (C++ Y'ALL OMG)" << endl;
    cout << "            █████     ██████     █████   ███████    ███████            █████      Version " + ver << " (universal)" << endl;
    cout << "            █████    ███████    █████   ████████   ████████           █████       Developed by <franzageek>                  " << endl;
    cout << "            █████   ████████   █████   █████████  █████████          █████                                                   " << endl;
    cout << "            █████  █████████  █████   ██████████ ██████████         █████         Window size: " << windowColumns << "x" << windowRows << endl;
    cout << "            █████ ██████████ █████   █████ ██████████ █████        █████                                                     " << endl;
    cout << "            ██████████ ██████████   █████  █████████  █████       █████                                                      " << endl;
    cout << "            █████████  █████████   █████   ████████   █████      █████            This program comes with no warranty        " << endl;
    cout << "            ████████   ████████   █████    ███████    █████     █████             at all, therefore I am not the responsible " << endl;
    cout << "            ███████    ███████   █████     ██████     █████    █████              for any damage that might be caused to your" << endl;
    cout << "            ██████     ██████   █████      █████      █████   █████               PC. Use WMI at your own risk.              " << endl;
    cout << "             ████       ████     ███        ███        ███     ███                                                           " << endl;
    for (int i = 19; i < (windowRows-4); i++)
    {
        cout << endl;
    }
    cout << header << endl;
    cout << endl;
    cout << "   Press any key to continue...";
    system("pause >nul");
    if (stage != "0" && stage != "1") //If Stage is neither 0 nor 1, throw an error and exit
    {
        clrscr();
        color("8f");
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           An error occurred." << endl << "           Please reboot your PC." << endl;
        for (int i = 8; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Press any key to exit...";
        system("pause >nul");
        while (exists(filesPath + "\\dism.txt")) //Old files cleanup
        {
            remove_all(filesPath + "\\dism.txt");
        }
        while (exists(filesPath + "\\dpscript.txt"))
        {
            remove_all(filesPath + "\\dpscript.txt");
        }
        reg_delete_value(WMIKey, "Stage");
        reg_delete_value(WMIKey, "KilledBeforeEnd");
        reg_delete_key(WMIKey);
        exit(1);
    }
    if (stage == "0") //Redirect to appropriate stage
    {
        clrscr();
        color("1f");
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    ■  Checking the installation drive" << endl;
        cout << endl;
        cout << "                    ■  Checking WMI launch drive" << endl;
        cout << endl;
        cout << "                    ■  Formatting the disk" << endl;
        cout << endl;
        cout << "                    ■  Installing Windows" << endl;
        cout << endl;
        cout << "                    ■  Generating boot files" << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Loading...";
        system("(echo exit) | diskpart >nul"); //Pre-load DiskPart, this task can usually take a while
        system("@dism >nul");
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                   [■] Checking the installation drive..." << endl;
        cout << endl;
        cout << "                    ■  Checking WMI launch drive" << endl;
        cout << endl;
        cout << "                    ■  Formatting the disk" << endl;
        cout << endl;
        cout << "                    ■  Installing Windows" << endl;
        cout << endl;
        cout << "                    ■  Generating boot files" << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Checking the installation drive...";
        for (int i = 0; i < 25; i++) //Scroll through every letter and search for some files
        {
            if ((string(1, toupper(alphabet[i]))) + ":\\" != execPath)
            {
                if (exists(string(1, alphabet[i]) + ":\\setup.exe"))
                {
                    if (exists(string(1, alphabet[i]) + ":\\sources\\"))
                    {
                        if (exists(string(1, alphabet[i]) + ":\\sources\\install.wim"))
                        {
                            installFile = string(1, alphabet[i]) + ":\\sources\\install.wim"; //If found, set the installDrive variable to that letter
                            installDrive = alphabet[i];
                            goto foundInstallDrive;
                        }
                        if (exists(string(1, alphabet[i]) + ":\\sources\\install.esd"))
                        {
                            installFile = string(1, alphabet[i]) + ":\\sources\\install.esd";
                            installDrive = alphabet[i];
                            goto foundInstallDrive;
                        }
                    }
                }
            }
        }
        wmi_rollback(INT_INSTALLER_NOT_FOUND, destDisk);
    
    foundInstallDrive:
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Checking the installation drive     │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Checking WMI launch drive..." << endl;
        cout << endl;
        cout << "                    ■  Formatting the disk" << endl;
        cout << endl;
        cout << "                    ■  Installing Windows" << endl;
        cout << endl;
        cout << "                    ■  Generating boot files" << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Checking WMI launch drive...";
        if (exists("C:\\") || execPath=="C:\\" || toupper(installDrive)=='C') //Check if the C letter is busy
        {
            color("8f");
            cout << "failed." << endl << "   [ERROR]: The C letter is already assigned to another drive!" << endl << "            (The error is issued when you have two or more disks installed" << endl << "            on your PC and Windows assigns the C letter to one of them.)" << endl;
            cout << endl;
            letter_selection_menu(windowsInstallLetter); //If busy, redirect to a function that allows the user to select another letter
        }
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Checking the installation drive     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Checking WMI launch drive           │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Formatting the disk..." << endl;
        cout << endl;
        cout << "                    ■  Installing Windows" << endl;
        cout << endl;
        cout << "                    ■  Generating boot files" << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Starting DiskPart...";
        system(("@echo lis dis > \""+ filesPath + "\\dpscript.txt\"").c_str()); //Create the script file for DiskPart
        system(("diskpart /s \""+ filesPath + "\\dpscript.txt\" > \""+ filesPath + "\\dpout.txt\"").c_str()); //Make DiskPart execute the script file while printing the output to a temporary text file
        ifstream dpout(filesPath + "\\dpout.txt"); //Needed to display a cleaner disk table
        string currentLine;
        clrscr();
        system(("@mode con lines=3000"));
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           Please take a look at the table shown below:" << endl;
        cout << endl;
        cout << endl;
        for (int i = 0; i <= 5; i++) 
        {
            getline(dpout, currentLine); //Skip DiskPart info lines
        }
        while (getline(dpout, currentLine)) 
        {
            cout << "                   " << currentLine << endl; //Display the disk table only, line by line
        }
        dpout.close();
        remove_all(filesPath + "\\dpout.txt"); //Remove the script file
        cout << endl;
        cout << endl;
        cout << "           WARNING: The selected disk will be formatted, and all the data will be lost." << endl;
        cout << "                    To abort the installation, press ESC." << endl;
        cout << "                    You may want to run WMI again to start the rollback procedure." << endl;
        system(("@FOR /F \"tokens=2\" %a IN ('diskpart /s " + filesPath + "\\dpscript.txt') DO @echo %a>>" + filesPath + "\\dpout.txt").c_str()); //Write 2nd token of DiskPart output into a file 
        system("@chcp 850 >nul"); //Code page change is needed because otherwise WMI would hang if an Extended ASCII character is entered at the prompt under code page 65001
    
    enterDiskNumber:
        ifstream diskNum(filesPath + "\\dpout.txt");
        for (int i = 0; i < 5; i++) 
        {
            getline(diskNum, currentLine); //Skip 5 lines
        }
        cout << endl;
        cout << " Type the number (just the number) corresponding to the disk you want to install Windows on: ";
        char input = ' ';
        input = getch(); //Get disk number from user input
        cout << input;
        if (input == 27)
        {
            color("0f");
            system(("@call \"" + filesPath + "\\fullscr.vbs" + "\"").c_str());
            clrscr();
            exit(0);
        }
        while (getline(diskNum, currentLine))
        {
            if (isdigit(input)) 
            {
                destDisk = char_to_int(input);
                if (to_string(destDisk) == currentLine) //If input is equal to line then jump
                {
                    goto proceedWithFormatting; 
                }
            }  
        }
        cout << "\n The disk number is not valid." << endl;
        diskNum.close();
        goto enterDiskNumber; //Jump back

    proceedWithFormatting:
        cout << "\n\n Press SPACE to confirm your choice, press any other key to discard it..."; //Wait for user confirmation
        input = ' ';
        input = getch();
        if (input != ' ')
        {
            cout << endl;
            diskNum.close();
            goto enterDiskNumber;
        }
        diskNum.close();
        remove_all(filesPath + "\\dpout.txt");
        system("@chcp 65001 >nul"); //Restore code page
        system(("@mode con lines=" + to_string(windowRows)).c_str());
        clrscr();
        color("1f");
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Checking the installation drive     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Checking WMI launch drive           │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Formatting the disk..." << endl;
        cout << endl;
        cout << "                    ■  Installing Windows" << endl;
        cout << endl;
        cout << "                    ■  Generating boot files" << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Formatting the disk...";
        if (!uefiFirmware) //Redirect to the appropriate case based on the firmware type 
        {
            system(("@echo sel dis " + to_string(destDisk) + " > " + filesPath + "\\dpscript.txt").c_str()); //Execute DiskPart commands, one by one, to format the selected drive the right way
            system(("@echo clean >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo conv mbr >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo cre par pri size=500 >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo for fs=ntfs >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo ass letter W >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo active >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo cre par pri >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo for fs=ntfs quick >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo ass letter " + string(1, windowsInstallLetter) + " >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo exit  >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo @diskpart /s \""+ filesPath + "\\dpscript.txt\" >" + filesPath + "\\dpexec.bat").c_str());
            system(("@call \"" + filesPath + "\\dpexec.bat" + "\" >nul").c_str());
        }
        else
        {
            system(("@echo sel dis " + to_string(destDisk) + " > " + filesPath + "\\dpscript.txt").c_str()); //Execute DiskPart commands, one by one, to format the selected drive the right way
            system(("@echo clean >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo conv gpt >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo cre par efi size=500 >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo for fs=fat32 >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo ass letter W >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo cre par pri >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo for fs=ntfs quick >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo ass letter " + string(1, windowsInstallLetter) + " >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo exit  >> " + filesPath + "\\dpscript.txt").c_str());
            system(("@echo @diskpart /s \""+ filesPath + "\\dpscript.txt\" >" + filesPath + "\\dpexec.bat").c_str());
            system(("@call \"" + filesPath + "\\dpexec.bat" + "\" >nul").c_str());
        }
        remove_all(filesPath + "\\dpscript.txt"); //Files cleanup
        remove_all(filesPath + "\\dpexec.bat");
        if (exists(filesPath + "\\dpout.txt"))
        {
            remove_all(filesPath + "\\dpout.txt");
        }
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           You now have to choose which Windows edition you want to install." << endl;
        cout << "           A Notepad window should pop up, and it should show something like this:" << endl;
        cout << endl;
        cout << "                              ╔════════════════════════════════╗             " << endl;
        cout << "                              ║             EXAMPLE            ║             " << endl;
        cout << "                              ╠════════════════════════════════╣             " << endl;
        cout << "                              ║                                ║             " << endl;
        cout << "                              ║  Index : 1                     ║             " << endl;
        cout << "                              ║  Name  : Windows 10 Home       ║             " << endl;
        cout << "                              ║  Description : Windows 10 Home ║             " << endl;
        cout << "                              ║  Size  : [size in bytes]       ║             " << endl;
        cout << "                              ║                                ║             " << endl;
        cout << "                              ║  Index : 2                     ║             " << endl;
        cout << "                              ║  Name  : Windows 10 Pro        ║             " << endl;
        cout << "                              ║  Description : Windows 10 Pro  ║             " << endl;
        cout << "                              ║  Size  : [size in bytes]       ║             " << endl;
        cout << "                              ╚════════════════════════════════╝             " << endl;
        cout << endl;
        cout << "           Choose the edition you want to install, read the corresponding INDEX " << endl;
        cout << "           and type it below." << endl;
        cout << "           (E.G.: if you wanted to install Windows 10 Pro, in the above scenario" << endl;
        cout << "                  you'd have to type 2.)" << endl;
        cout << endl;
        for (int i = 29; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Press any key to show available editions for your ISO file...";
        system("@pause>nul");
        try //If the user selected the Installed drive for installation, the following line would throw an exception
        {
            current_path(string(1, installDrive) + ":\\sources"); //Change the current directory to INSTALLER:\sources
        }
        catch (exception &ex)
        {
            wmi_rollback(INT_INSTALLER_NOT_FOUND, destDisk); //If an exception is thrown, call WMI Rollback
        }
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           (Close the Notepad window before proceeding)" << endl;
        cout << endl;
        if (system(("@dism /english /get-wiminfo /wimfile:" + installFile + " >\"" + filesPath + "\\dism.txt\"").c_str()) != 0) //Print WIM file information in a text file; if output is an error, call WMI Rollback
        {
            wmi_rollback(INT_WIMFILE_NOT_FOUND, destDisk);
        } 
        system(("@FOR /F \"tokens=3 usebackq\" %a IN (\"" + filesPath + "\\dism.txt\") DO @echo %a>>\"" + filesPath + "\\dism3.txt\"").c_str()); //Get the 3rd token from DISM output, should contain every available index value
        system(("@notepad \"" + filesPath + "\\dism.txt\"").c_str()); //Open up the text file containing WIM file info
        cout << "           Enter the INDEX number corresponding to the edition you want to install" << endl;
        cout << "           (JUST THE NUMBER, NO SPACES.)" << endl;
        cout << endl;
        cout << "           WARNING: If no valid INDEX value is provided, WMI will install the edition" << endl;
        cout << "                    corresponding to INDEX=1." << endl;
        cout << endl;
        cout << "           NOTICE: If the Notepad window has shown an error, enter \"0\" at the prompt." << endl;
        cout << "                   You'll be redirected to WMI Rollback, which will attempt to fix the problem." << endl;
        system("@chcp 850 >nul");

    enterIndex:
        cout << endl << " INDEX=";
        input = ' ';
        input = getch(); //Get user input
        cout << input;
        string failMsg = ""; //Set a temporary message (to be shown if an error gets thrown by DISM) as blank
        ifstream dismIndex(filesPath + "\\dism3.txt");
        for (int i = 0; i < 2; i++) 
        {
            getline(dismIndex, currentLine); //Skip 5 lines
        }
        int skipLines = 0;
        indexValue = char_to_int(input);
        while (getline(dismIndex, currentLine))
        {
            if (currentLine == "completed") //EOF
            {
                break;
            }
            if (skipLines == 1 || skipLines == 2) //Skip two lines
            {
                skipLines++;
                continue;
            }
            if (skipLines == 3)
            {
                skipLines = 0;
                continue;
            }
            if (isdigit(input)) 
            {
                if (indexValue == 0) //User is allowed to enter 0 at the prompt if DISM showed an error
                {
                    if (currentLine.find("Error:") != string::npos) //If an error has been thrown, call WMI Rollback
                    {
                        wmi_rollback(INT_WIMFILE_NOT_FOUND, destDisk);
                    }
                }
                if (to_string(indexValue) == currentLine) //If input is equal to line then jump
                {
                    dismIndex.close();
                    remove_all(filesPath + "\\dism3.txt"); //Remove temporary text files
                    remove_all(filesPath + "\\dism.txt");
                    goto dismInstallation; 
                }
            }
            skipLines++;
        }
        dismIndex.close();
        cout << "\n The INDEX number is not valid." << endl;
        goto enterIndex; //Jump back

    dismInstallation:
        system("@chcp 65001 >nul");
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Checking the installation drive     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Checking WMI launch drive           │ Done │" << endl;
        cout << "                                                           │      │"<< endl;
        cout << "                    +  Formatting the disk                 │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Installing Windows..." << endl;
        cout << endl;
        cout << "                    ■  Generating boot files" << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        cout << endl;
        cout << failMsg << endl;
        for (int i = 22; i < (windowRows-8); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        system(("@echo @dism /english /apply-image /imagefile:" + installFile + " /index:" + to_string(indexValue) + " /applydir:" + string(1, windowsInstallLetter) + ":\\ >" + filesPath + "\\dismexec.bat").c_str());
        int dismExitCode = system(("@call \"" + filesPath + "\\dismexec.bat" + "\"").c_str()); //Apply Windows WIM image onto the destination drive
        if (dismExitCode == 87) //Check if DISM threw an error
        {
            indexValue = 1;
            failMsg = " ## The INDEX value you entered was not valid, installing INDEX=1..."; //Set the fail message and jumps back
            goto dismInstallation;
        }
        else if (dismExitCode == 2 )
        {
            for (int i = 0; i < 25; i++) //Try to scan again through every drive to find the WIM image
            {
                if (exists(string(1, alphabet[i]) + ":\\sources\\install.wim"))
                {
                    installFile = string(1, alphabet[i]) + ":\\sources\\install.wim";
                    failMsg = "";
                    goto dismInstallation; //If found, set its path and jump back
                }
                if (exists(string(1, alphabet[i]) + ":\\sources\\install.esd"))
                {
                    installFile = string(1, alphabet[i]) + ":\\sources\\install.esd";
                    failMsg = "";
                    goto dismInstallation;
                }
            }
            wmi_rollback(INT_WIMFILE_NOT_FOUND, destDisk); //If not found, call WMI Rollback
        }
        else if (dismExitCode != 0)
        {
            wmi_rollback(INT_DISM_ERROR, destDisk); //If DISM exited with an error, call WMI Rollback
        }
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Checking the installation drive     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Checking WMI launch drive           │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Formatting the disk                 │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Installing Windows                  │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Generating boot files..." << endl;
        cout << endl;
        cout << "                    ■  Updating Registry settings" << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl << "   ";
        if (!uefiFirmware) //Redirect to the appropriate case based on the firmware type 
        {
            system(("@bcdboot " + string(1, windowsInstallLetter) + ":\\Windows /s W: /F BIOS").c_str()); //Generate boot files for BIOS firmware
        }
        else
        {
            system(("@bcdboot " + string(1, windowsInstallLetter) + ":\\Windows /s W: /F UEFI").c_str()); //Generate boot files for UEFI firmware
        }
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           This is the first portion of the setup. WMI will set everything up for you." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Checking the installation drive     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Checking WMI launch drive           │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Formatting the disk                 │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Installing Windows                  │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Generating boot files               │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Updating Registry settings..." << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Updating Windows Registry..." <<endl;
        system(("@reg load \"HKLM\\SOFT\" \"" + string(1, windowsInstallLetter) + ":\\Windows\\System32\\config\\SOFTWARE\" > nul").c_str()); //Load registry hives to tweak the Windows Registry
        system(("@reg load \"HKLM\\SYS\" \"" + string(1, windowsInstallLetter) + ":\\Windows\\System32\\config\\SYSTEM\" > nul").c_str());
        reg_create_value("SYS\\Setup", "cmd.exe /k C:\\wmi.exe", "CmdLine"); //Set some values
        reg_create_value("SYS\\Setup\\WMI", "1", "Stage");
        current_path(string(1, windowsInstallLetter) + ":\\");
        copy_file(execPath + "wmi.exe", string(1, windowsInstallLetter) + ":\\wmi.exe"); //Move WMI along with its dependencies to the destination drive
        create_directory(string(1, windowsInstallLetter) + ":\\WMIFILES\\");
        copy_file(execPath + "libgcc_s_seh-1.dll", string(1, windowsInstallLetter) + ":\\libgcc_s_seh-1.dll");
        copy_file(execPath + "libstdc++-6.dll", string(1, windowsInstallLetter) + ":\\libstdc++-6.dll");
        copy_file(execPath + "libwinpthread-1.dll", string(1, windowsInstallLetter) + ":\\libwinpthread-1.dll");
        copy_file(execPath + "WMIFILES\\COPYING", string(1, windowsInstallLetter) + ":\\WMIFILES\\COPYING");
        copy_file(execPath + "WMIFILES\\wpu.bat", string(1, windowsInstallLetter) + ":\\WMIFILES\\wpu.bat");
        copy_file(execPath + "WMIFILES\\fullscr.vbs", string(1, windowsInstallLetter) + ":\\WMIFILES\\fullscr.vbs");
        copy_file(execPath + "WMIFILES\\MAS_AIO.cmd", string(1, windowsInstallLetter) + ":\\WMIFILES\\MAS_AIO.cmd");
        rename(string(1, windowsInstallLetter) + ":\\Windows\\System32\\sethc.exe", string(1, windowsInstallLetter) + ":\\Windows\\System32\\oldsethc.exe");
        copy_file(string(1, windowsInstallLetter) + ":\\Windows\\System32\\cmd.exe", string(1, windowsInstallLetter) + ":\\Windows\\System32\\sethc.exe");
        remove_all(execPath + "WMIFILES");
        clrscr();
        color("3f");
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           *** READ CAREFULLY ***" << endl;
        cout << endl;
        cout << "                    Stage 0 is finally over. Please remove the installation medium and then press" << endl;
        cout << "                    any key to reboot your PC. WMI will automatically start after POST." << endl;
        cout << endl;
        cout << "                    NOTICE: WMI is no longer located on your USB drive, but it's been moved onto the " + string(1, windowsInstallLetter) + ":\\ drive." << endl;
        cout << "                            The WMI copy that was located on your USB is going to be reset in order not to cause" << endl;
        cout << "                            filename conflicts while running WMI." << endl;
        cout << endl;
        cout << "                    WMI will automatically start Stage 1 once your PC has rebooted." << endl;
        cout << "                    See you on the other side!" << endl;
        cout << endl;
        cout << "                    ╔═══════════════════════════════════════════════════════════════════════╗" << endl;
        cout << "                    ║ Remove the installation medium, then press any key to reboot your PC. ║" << endl;
        cout << "                    ╚═══════════════════════════════════════════════════════════════════════╝" << endl;
        for (int i = 21; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Remove the installation medium, then press any key to reboot your PC...";
        system("@pause>nul");
        color("0f");
        clrscr();
        cout << endl << endl << endl;
        for (int i = 0; i< windowColumns; i++)
        {
            cout << "█";
        }
        cout << endl;
        cout << endl;
        cout << endl;
        for (int i = 0; i < (windowColumns/2)-(45/2); i++)
        {
            cout << " ";
        }
        cout << "Rebooting your PC, this may take a while..." << endl;
        cout << endl;
        cout << endl;
        for (int i = 0; i < windowColumns; i++)
        {
            cout << "█";
        }
        system("@wpeutil reboot"); //Reboot the system
    }
    else if (stage == "1")
    {
        current_path("C:\\"); //Change directory to the root drive
        clrscr();
        color("1f");
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           Please wait for WMI to finish setting up Windows..." << endl;
        cout << endl;
        cout << endl;
        cout << "                   [■] Setting up drivers and services..." << endl;
        cout << endl;
        cout << "                    ■  Creating user account             " << endl;
        cout << "                                                         " << endl;
        cout << "                    ■  Updating Registry settings        " << endl;
        cout << "                                                         " << endl;
        cout << "                    ■  Cleaning up environment           " << endl;
        cout << "                                                         " << endl;
        cout << endl;
        cout << endl;
        cout << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   WinDeploy is running..." <<endl;
        current_path("C:\\Windows\\System32");
        system("@oobe\\windeploy"); //Start WinDeploy to set up all the drivers and services
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           Please wait for WMI to finish setting up Windows..." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Setting up drivers and services     │ Done │" << endl;
        cout << endl;
        cout << "                   [■] Creating user account...          " << endl;
        cout << "                                                         " << endl;
        cout << "                    ■  Updating Registry settings        " << endl;
        cout << "                                                         " << endl;
        cout << "                    ■  Cleaning up environment           " << endl;
        cout << "                                                         " << endl;
        cout << endl;
        cout << endl;
        cout << endl;
    enterUsername:
        string winUserName = "user";
        cout << " Enter a username: ";
        cin >> winUserName; //Get user input
        string winUserNameLC = winUserName;
        std::transform(winUserNameLC.begin(), winUserNameLC.end(), winUserNameLC.begin(), ::tolower); //Make the input lowercase to check if a forbidden username was entered
        if (winUserNameLC == "con" || winUserNameLC == "aux" || winUserNameLC == "nul" || winUserNameLC == "defaultuser0" || winUserNameLC == " " )
        {
            cout << " The username you entered is not valid." << endl;
            goto enterUsername; //If input is a forbidden username, then jump back
        }
        cout << endl << " ";
        switch (system("@choice /c yn /m \"Do you want to add a password\"")) //Ask the user for a password
        {
            case 1:
            {
                goto enterPassword;
            }
            case 2:
            {
                goto addUserWithoutPassword;
            }
        }
        
    enterPassword:
        cout << " Enter a password: ";
        cin >> winPassword;
        system(("@net user /add \"" + winUserName + "\" \"" + winPassword + "\" >nul 2>nul").c_str()); //Add the user with the entered password
        system(("@net localgroup /add Users \"" + winUserName + "\" >nul 2>nul").c_str());
        system(("@net localgroup /add Administrators \"" + winUserName + "\" >nul 2>nul").c_str());
        goto endOfUserSetup;

    addUserWithoutPassword:
        system(("@net user /add \"" + winUserName + "\" >nul 2>nul").c_str()); //Add the user without adding any password
        system(("@net localgroup /add Users \"" + winUserName + "\" >nul 2>nul").c_str());
        system(("@net localgroup /add Administrators \"" + winUserName + "\" >nul 2>nul").c_str());

    endOfUserSetup:
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           Please wait for WMI to finish setting up Windows..." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Setting up drivers and services     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Creating user account               │ Done │" << endl;
        cout << "                                                                   " << endl;
        cout << "                   [■] Updating Registry settings...     " << endl;
        cout << "                                                         " << endl;
        cout << "                    ■  Cleaning up environment           " << endl;
        cout << "                                                         " << endl;
        cout << endl;
        cout << endl;
        cout << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Updating Windows Registry..." <<endl;
        system("@reg add \"HKLM\\SYSTEM\\Setup\" /v \"OOBEInProgress\" /f /t REG_DWORD /d \"0\" >nul"); //Set some registry values
        system("@reg add \"HKLM\\SYSTEM\\Setup\" /v \"SetupType\" /f /t REG_DWORD /d \"0\" >nul");
        system("@reg add \"HKLM\\SYSTEM\\Setup\" /v \"SetupPhase\" /f /t REG_DWORD /d \"0\" >nul");
        reg_create_value("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State", "IMAGE_STATE_COMPLETE", "ImageState"); //Needed to exit from Audit mode
        if (reg_query_value("SYSTEM\\Setup", "AuditInProgress")) 
        {
            reg_delete_value("SYSTEM\\Setup", "AuditInProgress"); //Needed to exit from Audit mode
        }
        system("@reg add \"HKLM\\SYSTEM\\Setup\" /v \"SystemSetupInProgress\" /f /t REG_DWORD /d \"0\" >nul");
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           Please wait for WMI to finish setting up Windows..." << endl;
        cout << endl;
        cout << endl;
        cout << "                    +  Setting up drivers and services     │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Creating user account               │ Done │" << endl;
        cout << "                                                           │      │" << endl;
        cout << "                    +  Updating Registry settings          │ Done │" << endl;
        cout << "                                                         " << endl;
        cout << "                   [■] Cleaning up environment...        " << endl;
        cout << "                                                         " << endl;
        cout << endl;
        cout << endl;
        cout << endl;
        for (int i = 20; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Please wait..." <<endl;
        copy_file("C:\\WMIFILES\\wpu.bat", "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\StartUp\\wpu.bat"); //With this the WMI Post-Install Utility will automatically run at logon  
        remove_all("C:\\WMIFILES\\wpu.bat"); //Remove the local copy of the WPU
        clrscr();
        color("3f");
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "           *** READ CAREFULLY ***" << endl;
        cout << endl;
        cout << "                    Windows has been successfully set up. Please press any key to enter Stage 2." << endl;
        cout << "                    Your PC will reboot and you'll see the \"Getting Windows ready\" loading screen." << endl;
        cout << endl;
        cout << "                    You'll then get to the desktop, and the setup will be over."<< endl;
        cout << "                    Windows will then be ready for normal use." << endl;
        cout << "                    ┌───────────────────────────────────────────────────────────────────────────────────────────────┐ " << endl;
        cout << "                    │ NOTICE: Once you get to the desktop, WMI Post-Install Utility will be launched.               │ " << endl;
        cout << "                    │         You'll be able to perform basic post-install actions like creating another            │ " << endl;
        cout << "                    │         user account, activating Windows with MAS and so on & so forth.                       │ " << endl;
        cout << "                    │         The Post-Install Utility also allows you to delete all the remaining files that       │ " << endl;
        cout << "                    │         were used during setup but are no longer required by WMI or by the Windows Setup.     │ " << endl;
        cout << "                    │         We suggest you to perform this action once you're done using the Post-Install Utility │ " << endl;
        cout << "                    │         as there might be some WMI files still laying around. To do so, once the Post-Install │ " << endl;
        cout << "                    │         Utility has started up, press \"4\" on the keyboard and then \"U\" to confirm.            │ " << endl;
        cout << "                    │         Please note that this will delete the Utility executable file as well.                │ " << endl;
        cout << "                    └───────────────────────────────────────────────────────────────────────────────────────────────┘ " << endl;
        cout << "                    ╔═════════════════════════════════════╗" << endl;
        cout << "                    ║ Please press any key to continue... ║" << endl;
        cout << "                    ╚═════════════════════════════════════╝" << endl;
        for (int i = 27; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Please press any key to continue...";
        system("@pause>nul");
        clrscr();
        cout << endl;
        cout << "   Windows Manual Installer v" << ver << " - Stage " << stage << endl;
        cout << endl;
        cout << header << endl;
        cout << endl;
        cout << endl;
        cout << "       █  █  █   █  █     █                                            " << endl;
        cout << "       █ ██ █   ██ ██    █    Windows Manual Installer (universal) v" << ver << endl;
        cout << "       ██ ██   █ ██ █   █     Developed by <franzageek>                " << endl;
        cout << "       █  █   █  █  █  █                                               " << endl;
        cout << endl;
        cout << "       Thank you for choosing to use WMI!"<< endl;
        cout << "       If you've experienced any kind of problem, please open an issue at the link" << endl;
        cout << "       \"github.com/franzageek/wmi/issues\" and I'll try to fix it as soon as possible. " << endl;
        cout << endl;
        cout << "       <franzageek> - github.com/franzageek" << endl;
        cout << endl;
        cout << endl;
        cout << "       Includes WMI Rollback v0.1.7, first C++ rewrite" << endl;
        cout << endl;
        cout << endl;
        cout << "       To fill in an issue report, please go to: \"github.com/franzageek/wmi/issues\"" << endl;
        cout << endl;
        cout << endl;
        cout << "                    ╔══════════════════════════════════════════╗" << endl;
        cout << "                    ║ Please press any key to enter Stage 2... ║" << endl;
        cout << "                    ╚══════════════════════════════════════════╝" << endl;
        for (int i = 27; i < (windowRows-4); i++)
        {
            cout << endl;
        }
        cout << header << endl;
        cout << endl;
        cout << "   Please press any key to enter Stage 2...";
        system("@pause>nul");
        system("@echo off");
        system("@shutdown /r /t 0 /c \"WMI has scheduled a reboot for you.\""); //Reboot the system
        color("0f");
        clrscr();
        cout << endl << endl << endl;
        for (int i = 0; i< windowColumns; i++)
        {
            cout << "█";
        }
        cout << endl;
        cout << endl;
        cout << endl;
        for (int i = 0; i < (windowColumns/2)-(45/2); i++)
        {
            cout << " ";
        }
        cout << "Rebooting your PC, this may take a while..." << endl;
        cout << endl;
        cout << endl;
        for (int i = 0; i < windowColumns; i++)
        {
            cout << "█";
        }
        for(;;);
    }
}