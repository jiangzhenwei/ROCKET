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
include apps/visibility/CMakeFiles/DOPcalc.dir/depend.make

# Include the progress variables for this target.
include apps/visibility/CMakeFiles/DOPcalc.dir/progress.make

# Include the compile flags for this target's objects.
include apps/visibility/CMakeFiles/DOPcalc.dir/flags.make

apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o: apps/visibility/CMakeFiles/DOPcalc.dir/flags.make
apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o: ../apps/visibility/DOPcalc.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/visibility/DOPcalc.cpp

apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DOPcalc.dir/DOPcalc.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/visibility/DOPcalc.cpp > CMakeFiles/DOPcalc.dir/DOPcalc.cpp.i

apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DOPcalc.dir/DOPcalc.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/visibility/DOPcalc.cpp -o CMakeFiles/DOPcalc.dir/DOPcalc.cpp.s

apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.requires:
.PHONY : apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.requires

apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.provides: apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.requires
	$(MAKE) -f apps/visibility/CMakeFiles/DOPcalc.dir/build.make apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.provides.build
.PHONY : apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.provides

apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.provides.build: apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o

# Object files for target DOPcalc
DOPcalc_OBJECTS = \
"CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o"

# External object files for target DOPcalc
DOPcalc_EXTERNAL_OBJECTS =

apps/visibility/DOPcalc: apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o
apps/visibility/DOPcalc: apps/visibility/CMakeFiles/DOPcalc.dir/build.make
apps/visibility/DOPcalc: libgpstk.dylib
apps/visibility/DOPcalc: apps/visibility/CMakeFiles/DOPcalc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable DOPcalc"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DOPcalc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/visibility/CMakeFiles/DOPcalc.dir/build: apps/visibility/DOPcalc
.PHONY : apps/visibility/CMakeFiles/DOPcalc.dir/build

apps/visibility/CMakeFiles/DOPcalc.dir/requires: apps/visibility/CMakeFiles/DOPcalc.dir/DOPcalc.cpp.o.requires
.PHONY : apps/visibility/CMakeFiles/DOPcalc.dir/requires

apps/visibility/CMakeFiles/DOPcalc.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility && $(CMAKE_COMMAND) -P CMakeFiles/DOPcalc.dir/cmake_clean.cmake
.PHONY : apps/visibility/CMakeFiles/DOPcalc.dir/clean

apps/visibility/CMakeFiles/DOPcalc.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/visibility /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility /Users/shjzhang/Documents/Develop/gpstk/build/apps/visibility/CMakeFiles/DOPcalc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/visibility/CMakeFiles/DOPcalc.dir/depend

