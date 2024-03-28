COMPILER=g++
ARGS=$(VERBOSE) $(64BIT) $(C++23)

32BIT=-m32
64BIT=-m64
C++23=-std=c++23
VERBOSE=-v -Wall
DEBUG=-g -Werror

all: bin/wmi.exe

bin/wmi.exe: src/*.cpp
	$(COMPILER) src/*.cpp -o bin/wmi.exe $(ARGS)
	@echo "WMI has been compiled successfully."

install:
	@echo "Building WMI..."
	@mkdir install
	@mkdir install/WMIFILES
	$(COMPILER) src/*.cpp -o install/wmi.exe $(ARGS)
	@cp -v -R deps/dlls/* install/
	@cp -v -R deps/WMIFILES/* install/WMIFILES/
	@echo "WMI has been built successfully."

clean:
	@echo "Removing previous build files..."
ifneq (,$(wildcard install/))
	@rm -rf install
endif
ifneq (,$(wildcard ./bin/wmi.exe))
	@rm -rf ./bin/wmi.exe
endif
	@echo "Done."