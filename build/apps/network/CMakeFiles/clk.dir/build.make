# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /sw/bin/cmake

# The command to remove a file.
RM = /sw/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /sw/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shjzhang/Documents/Develop/gpstk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shjzhang/Documents/Develop/gpstk/build

# Include any dependencies generated for this target.
include apps/network/CMakeFiles/clk.dir/depend.make

# Include the progress variables for this target.
include apps/network/CMakeFiles/clk.dir/progress.make

# Include the compile flags for this target's objects.
include apps/network/CMakeFiles/clk.dir/flags.make

apps/network/CMakeFiles/clk.dir/clk.cpp.o: apps/network/CMakeFiles/clk.dir/flags.make
apps/network/CMakeFiles/clk.dir/clk.cpp.o: ../apps/network/clk.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/network/CMakeFiles/clk.dir/clk.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/network && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clk.dir/clk.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/network/clk.cpp

apps/network/CMakeFiles/clk.dir/clk.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clk.dir/clk.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/network/clk.cpp > CMakeFiles/clk.dir/clk.cpp.i

apps/network/CMakeFiles/clk.dir/clk.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clk.dir/clk.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/network/clk.cpp -o CMakeFiles/clk.dir/clk.cpp.s

apps/network/CMakeFiles/clk.dir/clk.cpp.o.requires:
.PHONY : apps/network/CMakeFiles/clk.dir/clk.cpp.o.requires

apps/network/CMakeFiles/clk.dir/clk.cpp.o.provides: apps/network/CMakeFiles/clk.dir/clk.cpp.o.requires
	$(MAKE) -f apps/network/CMakeFiles/clk.dir/build.make apps/network/CMakeFiles/clk.dir/clk.cpp.o.provides.build
.PHONY : apps/network/CMakeFiles/clk.dir/clk.cpp.o.provides

apps/network/CMakeFiles/clk.dir/clk.cpp.o.provides.build: apps/network/CMakeFiles/clk.dir/clk.cpp.o

# Object files for target clk
clk_OBJECTS = \
"CMakeFiles/clk.dir/clk.cpp.o"

# External object files for target clk
clk_EXTERNAL_OBJECTS =

apps/network/clk: apps/network/CMakeFiles/clk.dir/clk.cpp.o
apps/network/clk: apps/network/CMakeFiles/clk.dir/build.make
apps/network/clk: libgpstk.dylib
apps/network/clk: apps/network/CMakeFiles/clk.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable clk"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/network && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clk.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/network/CMakeFiles/clk.dir/build: apps/network/clk
.PHONY : apps/network/CMakeFiles/clk.dir/build

apps/network/CMakeFiles/clk.dir/requires: apps/network/CMakeFiles/clk.dir/clk.cpp.o.requires
.PHONY : apps/network/CMakeFiles/clk.dir/requires

apps/network/CMakeFiles/clk.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/network && $(CMAKE_COMMAND) -P CMakeFiles/clk.dir/cmake_clean.cmake
.PHONY : apps/network/CMakeFiles/clk.dir/clean

apps/network/CMakeFiles/clk.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/network /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/network /Users/shjzhang/Documents/Develop/gpstk/build/apps/network/CMakeFiles/clk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/network/CMakeFiles/clk.dir/depend

