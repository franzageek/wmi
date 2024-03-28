#include "../include/core.hpp"

std::filesystem::path currentDir = std::filesystem::current_path();
const std::string execPath = get_executable_path();
const std::string ver = "0.5.0";
const std::string filesPath = execPath + "\\WMIFILES";
const std::string WMIKey = "SYSTEM\\Setup\\WMI";
bool uefiFirmware;
int windowColumns;
int windowRows;
char alphabet[26] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
std::string installFile = "";
char installDrive = ' ';
char windowsInstallLetter = 'C';
int destDisk = NV;
int indexValue = NV;
std::string winUserName = "user";
std::string winPassword = "";

std::string get_executable_path() 
{
    for (int i =0; i <= 25; i++)
    {
        if (std::filesystem::exists(std::string(1, alphabet[i]) + ":\\wmi.exe")) //Scroll through every letter to find the root drive from where WMI is launched
        {
            return (std::string(1, alphabet[i]) + ":\\"); //Return the drive letter
        }
    }
    return "NF"; //If not found, return NF
}

void get_window_size(int& columns, int& rows)
{
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &csbi); //Get console height and width
    columns = csbi.srWindow.Right - csbi.srWindow.Left + 1;
    rows = csbi.srWindow.Bottom - csbi.srWindow.Top + 1;
}

void letter_selection_menu(char& windowsInstallLetter) 
{
    std::cout << "   Press any key to select another letter...";
    system("pause >nul");
    color("0f");
    std::cout << std::endl;
    std::cout << std::endl;
    std::cout << "   You have to choose a new drive letter for your Windows installation.\n   You cannot choose C.\n   Enter whatever letter of the alphabet you want, and WMI will assign it\n   to the disk you will choose to install Windows on.\n\n   The letter you will choose will be kept for the first part of the setup only.\n   It will be restored to C once Windows is done setting up.\n\n   Input example: K (not K: , K:\\ , \"K\" , \"K:\" or \"K:\\\" - just K)\n\n   [ENTER YOUR LETTER IN CAPS]\n";
    system("@chcp 850 >nul");
enterLetter:
    std::cout << "\n Enter the letter (just the letter) you want to assign to the destination drive:";
    windowsInstallLetter = getch(); //Get input from the user
    std::cout << windowsInstallLetter;
    if (std::toupper(windowsInstallLetter) == 'W' || std::toupper(windowsInstallLetter) == 'A' || std::toupper(windowsInstallLetter) == 'B' || std::toupper(windowsInstallLetter) == 'C') //Check if input is a system reserved letter
    {
        std::cout << std::endl;
        std::cout << " System reserved letter." << std::endl;
        goto enterLetter;
    }
    for (int i =0; i <=25; i++) 
    {
        if(std::toupper(windowsInstallLetter) == alphabet[i])
        {
            if (std::filesystem::exists(std::string(1, windowsInstallLetter) + ":\\")) //Check if input is a busy letter
            {
                std::cout << std::endl;
                std::cout << " The letter is already taken" << std::endl;
                goto enterLetter;
            }
            color("1f");
            system("@chcp 65001 >nul");
            return; //If the entered letter is available, return (the letter is saved into the variable that is passed by reference)
        }
    }
    goto enterLetter;
}

void clrscr()
{
    system("@cls");
}

void color(std::string color) 
{
    system(("@color " + color).c_str()); //Tweak to easily change the console color
}

int char_to_int(char c)
{
    int i = NV;
    if (isdigit(c)) 
    {
        return i = c - 48; //If the char (that was passed as a function argument) is a valid ASCII digit, then subtract the ASCII value of 0 from the ASCII value of the entered char; then return the result of that subtraction as an int
    }
    return i;
}

void set_line_color(unsigned short color)
{
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, color);
}