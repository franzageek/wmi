#ifndef REG_HPP
#define REG_HPP
#include <iostream>
#include <Windows.h>
#include <winreg.h>
#define err 1
#define succ 0

int reg_create_key(std::string);
int reg_create_value(std::string, const char*, std::string);
int reg_get_value(std::string, std::string, std::string&);
int reg_query_value(std::string, std::string);
int reg_delete_key(std::string);
int reg_delete_value(std::string, std::string);


#endif //REG_HPP