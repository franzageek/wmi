#ifndef CORE_HPP
#define CORE_HPP
#include <iostream>
#include <filesystem>
#include <cstdlib>
#include <conio.h>
#include <stdlib.h>
#include <string>
#include <string_view>
#include <fstream>
#include <algorithm>
#include <Windows.h>
#include <Psapi.h>
#include <winreg.h>
#define err 1
#define succ 0
#define NV -4095


std::string get_executable_path();
int char_to_int(char);
void get_window_size(int&, int&);
void letter_selection_menu(char&);
void clrscr(void);
void color(std::string);
void set_line_color(unsigned short);

extern std::filesystem::path currentDir;
extern const std::string execPath;
extern const std::string ver;
extern const std::string filesPath;
extern const std::string WMIKey;
extern bool uefiFirmware;
extern int windowColumns;
extern int windowRows;
extern char alphabet[26];
extern std::string installFile;
extern char installDrive;
extern char windowsInstallLetter;
extern int destDisk;
extern int indexValue;
extern std::string winUserName;
extern std::string winPassword;

#endif //CORE_HPP