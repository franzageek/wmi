#include "../include/reg.hpp"

int reg_create_key(std::string keyPath) 
    {
        HKEY hKey;
        long ec = RegCreateKeyExA(HKEY_LOCAL_MACHINE, (LPCSTR)keyPath.c_str(), 0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &hKey, NULL); //ec = exit code
        RegCloseKey(hKey);
        if (ec == ERROR_SUCCESS) 
        {
            return succ;
        } 
        else 
        {
            return err;
        }
    }

int reg_create_value(std::string keyPath, const char* valContent, std::string valName)
    {
        HKEY hKey;
        long ec = RegOpenKeyExA(HKEY_LOCAL_MACHINE, (LPCSTR)keyPath.c_str(), 0, KEY_ALL_ACCESS, &hKey);
        if (ec == ERROR_SUCCESS)
        {
            long ec = RegSetValueExA(hKey, (LPCSTR)valName.c_str(), 0, REG_SZ, (LPBYTE)valContent, strlen(valContent)*sizeof(char));
            if (ec == ERROR_SUCCESS) 
            {
                return succ;
            } 
            else 
            {
                return err;
            }
        }
        else
        {
            return err;
        }
    }

int reg_get_value(std::string keyPath, std::string valName, std::string& data)
    {
        HKEY hKey;
        CHAR szBuffer[512];
        DWORD dwBufferSize = sizeof(szBuffer);
        long ec = RegOpenKeyExA(HKEY_LOCAL_MACHINE, (LPCSTR)keyPath.c_str(), 0, KEY_ALL_ACCESS, &hKey);
        if (ec == ERROR_SUCCESS)
        {
            long ec = RegQueryValueExA(hKey, (LPCSTR)valName.c_str(), 0, NULL, (LPBYTE)szBuffer, &dwBufferSize);
            if (ec == ERROR_SUCCESS) 
            {
                data = szBuffer;
                return succ;
            } 
            else 
            {
                return err;
            }
        }
        else
        {
            return err;
        }
    }

int reg_query_value(std::string keyPath, std::string valName)
    {
        HKEY hKey;
        long ec = RegOpenKeyExA(HKEY_LOCAL_MACHINE, (LPCSTR)keyPath.c_str(), 0, KEY_ALL_ACCESS, &hKey);
        if (ec == ERROR_SUCCESS)
        {
            long ec = RegQueryValueExA(hKey, (LPCSTR)valName.c_str(), 0, NULL, NULL, NULL);
            if (ec == ERROR_SUCCESS) 
            {
                return succ;
            } 
            else 
            {
                return err;
            }
        }
        else
        {
            return err;
        }
    }

int reg_delete_key(std::string keyPath) 
    {
        long ec = RegDeleteKeyA(HKEY_LOCAL_MACHINE, (LPCSTR)keyPath.c_str());
        if (ec == ERROR_SUCCESS) 
        {
            return succ;
        }
        else
        {
            return err;
        }
    }

int reg_delete_value(std::string keyPath, std::string valName)
    {
        HKEY hKey;
        long ec = RegOpenKeyExA(HKEY_LOCAL_MACHINE, (LPCSTR)keyPath.c_str(), 0, KEY_ALL_ACCESS, &hKey);
        if (ec == ERROR_SUCCESS)
        {
            long ec = RegDeleteValueA(hKey, (LPCSTR)valName.c_str());
            if (ec == ERROR_SUCCESS) 
            {
                return succ;
            } 
            else 
            {
                return err;
            }
        }
        else
        {
            return err;
        }
    }
