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
include apps/mergetools/CMakeFiles/mergeRinMet.dir/depend.make

# Include the progress variables for this target.
include apps/mergetools/CMakeFiles/mergeRinMet.dir/progress.make

# Include the compile flags for this target's objects.
include apps/mergetools/CMakeFiles/mergeRinMet.dir/flags.make

apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o: apps/mergetools/CMakeFiles/mergeRinMet.dir/flags.make
apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o: ../apps/mergetools/mergeRinMet.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/mergetools/mergeRinMet.cpp

apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/mergetools/mergeRinMet.cpp > CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.i

apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/mergetools/mergeRinMet.cpp -o CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.s

apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.requires:
.PHONY : apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.requires

apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.provides: apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.requires
	$(MAKE) -f apps/mergetools/CMakeFiles/mergeRinMet.dir/build.make apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.provides.build
.PHONY : apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.provides

apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.provides.build: apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o

# Object files for target mergeRinMet
mergeRinMet_OBJECTS = \
"CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o"

# External object files for target mergeRinMet
mergeRinMet_EXTERNAL_OBJECTS =

apps/mergetools/mergeRinMet: apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o
apps/mergetools/mergeRinMet: apps/mergetools/CMakeFiles/mergeRinMet.dir/build.make
apps/mergetools/mergeRinMet: libgpstk.dylib
apps/mergetools/mergeRinMet: apps/mergetools/CMakeFiles/mergeRinMet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mergeRinMet"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mergeRinMet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/mergetools/CMakeFiles/mergeRinMet.dir/build: apps/mergetools/mergeRinMet
.PHONY : apps/mergetools/CMakeFiles/mergeRinMet.dir/build

apps/mergetools/CMakeFiles/mergeRinMet.dir/requires: apps/mergetools/CMakeFiles/mergeRinMet.dir/mergeRinMet.cpp.o.requires
.PHONY : apps/mergetools/CMakeFiles/mergeRinMet.dir/requires

apps/mergetools/CMakeFiles/mergeRinMet.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools && $(CMAKE_COMMAND) -P CMakeFiles/mergeRinMet.dir/cmake_clean.cmake
.PHONY : apps/mergetools/CMakeFiles/mergeRinMet.dir/clean

apps/mergetools/CMakeFiles/mergeRinMet.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/mergetools /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools /Users/shjzhang/Documents/Develop/gpstk/build/apps/mergetools/CMakeFiles/mergeRinMet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/mergetools/CMakeFiles/mergeRinMet.dir/depend

