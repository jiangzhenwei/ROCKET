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
include apps/dev/CMakeFiles/pppxar2.dir/depend.make

# Include the progress variables for this target.
include apps/dev/CMakeFiles/pppxar2.dir/progress.make

# Include the compile flags for this target's objects.
include apps/dev/CMakeFiles/pppxar2.dir/flags.make

apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o: apps/dev/CMakeFiles/pppxar2.dir/flags.make
apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o: ../apps/dev/pppxar2.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/pppxar2.dir/pppxar2.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/dev/pppxar2.cpp

apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pppxar2.dir/pppxar2.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/dev/pppxar2.cpp > CMakeFiles/pppxar2.dir/pppxar2.cpp.i

apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pppxar2.dir/pppxar2.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/dev/pppxar2.cpp -o CMakeFiles/pppxar2.dir/pppxar2.cpp.s

apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.requires:
.PHONY : apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.requires

apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.provides: apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.requires
	$(MAKE) -f apps/dev/CMakeFiles/pppxar2.dir/build.make apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.provides.build
.PHONY : apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.provides

apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.provides.build: apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o

# Object files for target pppxar2
pppxar2_OBJECTS = \
"CMakeFiles/pppxar2.dir/pppxar2.cpp.o"

# External object files for target pppxar2
pppxar2_EXTERNAL_OBJECTS =

apps/dev/pppxar2: apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o
apps/dev/pppxar2: apps/dev/CMakeFiles/pppxar2.dir/build.make
apps/dev/pppxar2: libgpstk.dylib
apps/dev/pppxar2: apps/dev/CMakeFiles/pppxar2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable pppxar2"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pppxar2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/dev/CMakeFiles/pppxar2.dir/build: apps/dev/pppxar2
.PHONY : apps/dev/CMakeFiles/pppxar2.dir/build

apps/dev/CMakeFiles/pppxar2.dir/requires: apps/dev/CMakeFiles/pppxar2.dir/pppxar2.cpp.o.requires
.PHONY : apps/dev/CMakeFiles/pppxar2.dir/requires

apps/dev/CMakeFiles/pppxar2.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev && $(CMAKE_COMMAND) -P CMakeFiles/pppxar2.dir/cmake_clean.cmake
.PHONY : apps/dev/CMakeFiles/pppxar2.dir/clean

apps/dev/CMakeFiles/pppxar2.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/dev /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev /Users/shjzhang/Documents/Develop/gpstk/build/apps/dev/CMakeFiles/pppxar2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/dev/CMakeFiles/pppxar2.dir/depend

