#ifndef ROLLBACK_HPP
#define ROLLBACK_HPP
#include <iostream>
#include <string>
#include <Windows.h>
#define INT_WIMFILE_NOT_FOUND -10
#define INT_DISM_ERROR -11
#define INT_INSTALLER_NOT_FOUND -12
#define INT_INVOKED_FROM_COMMAND_LINE -13
#define INT_KILLED_BEFORE_END -14


void wmi_rollback(int, int&);
void disk_selection_menu(int&);
void disk_formatting(int);


#endif //ROLLBACK_HPP