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
include apps/time/CMakeFiles/calgps.dir/depend.make

# Include the progress variables for this target.
include apps/time/CMakeFiles/calgps.dir/progress.make

# Include the compile flags for this target's objects.
include apps/time/CMakeFiles/calgps.dir/flags.make

apps/time/CMakeFiles/calgps.dir/calgps.cpp.o: apps/time/CMakeFiles/calgps.dir/flags.make
apps/time/CMakeFiles/calgps.dir/calgps.cpp.o: ../apps/time/calgps.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/time/CMakeFiles/calgps.dir/calgps.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/time && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/calgps.dir/calgps.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/time/calgps.cpp

apps/time/CMakeFiles/calgps.dir/calgps.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calgps.dir/calgps.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/time && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/time/calgps.cpp > CMakeFiles/calgps.dir/calgps.cpp.i

apps/time/CMakeFiles/calgps.dir/calgps.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calgps.dir/calgps.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/time && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/time/calgps.cpp -o CMakeFiles/calgps.dir/calgps.cpp.s

apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.requires:
.PHONY : apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.requires

apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.provides: apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.requires
	$(MAKE) -f apps/time/CMakeFiles/calgps.dir/build.make apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.provides.build
.PHONY : apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.provides

apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.provides.build: apps/time/CMakeFiles/calgps.dir/calgps.cpp.o

# Object files for target calgps
calgps_OBJECTS = \
"CMakeFiles/calgps.dir/calgps.cpp.o"

# External object files for target calgps
calgps_EXTERNAL_OBJECTS =

apps/time/calgps: apps/time/CMakeFiles/calgps.dir/calgps.cpp.o
apps/time/calgps: apps/time/CMakeFiles/calgps.dir/build.make
apps/time/calgps: libgpstk.dylib
apps/time/calgps: apps/time/CMakeFiles/calgps.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable calgps"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/time && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/calgps.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/time/CMakeFiles/calgps.dir/build: apps/time/calgps
.PHONY : apps/time/CMakeFiles/calgps.dir/build

apps/time/CMakeFiles/calgps.dir/requires: apps/time/CMakeFiles/calgps.dir/calgps.cpp.o.requires
.PHONY : apps/time/CMakeFiles/calgps.dir/requires

apps/time/CMakeFiles/calgps.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/time && $(CMAKE_COMMAND) -P CMakeFiles/calgps.dir/cmake_clean.cmake
.PHONY : apps/time/CMakeFiles/calgps.dir/clean

apps/time/CMakeFiles/calgps.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/time /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/time /Users/shjzhang/Documents/Develop/gpstk/build/apps/time/CMakeFiles/calgps.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/time/CMakeFiles/calgps.dir/depend

