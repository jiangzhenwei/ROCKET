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
include apps/swrx/CMakeFiles/gpsSim.dir/depend.make

# Include the progress variables for this target.
include apps/swrx/CMakeFiles/gpsSim.dir/progress.make

# Include the compile flags for this target's objects.
include apps/swrx/CMakeFiles/gpsSim.dir/flags.make

apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o: apps/swrx/CMakeFiles/gpsSim.dir/flags.make
apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o: ../apps/swrx/gpsSim.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gpsSim.dir/gpsSim.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/swrx/gpsSim.cpp

apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpsSim.dir/gpsSim.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/swrx/gpsSim.cpp > CMakeFiles/gpsSim.dir/gpsSim.cpp.i

apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpsSim.dir/gpsSim.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/swrx/gpsSim.cpp -o CMakeFiles/gpsSim.dir/gpsSim.cpp.s

apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.requires:
.PHONY : apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.requires

apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.provides: apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.requires
	$(MAKE) -f apps/swrx/CMakeFiles/gpsSim.dir/build.make apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.provides.build
.PHONY : apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.provides

apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.provides.build: apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o

# Object files for target gpsSim
gpsSim_OBJECTS = \
"CMakeFiles/gpsSim.dir/gpsSim.cpp.o"

# External object files for target gpsSim
gpsSim_EXTERNAL_OBJECTS =

apps/swrx/gpsSim: apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o
apps/swrx/gpsSim: apps/swrx/CMakeFiles/gpsSim.dir/build.make
apps/swrx/gpsSim: apps/swrx/libsimlib.a
apps/swrx/gpsSim: libgpstk.dylib
apps/swrx/gpsSim: apps/swrx/CMakeFiles/gpsSim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable gpsSim"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gpsSim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/swrx/CMakeFiles/gpsSim.dir/build: apps/swrx/gpsSim
.PHONY : apps/swrx/CMakeFiles/gpsSim.dir/build

apps/swrx/CMakeFiles/gpsSim.dir/requires: apps/swrx/CMakeFiles/gpsSim.dir/gpsSim.cpp.o.requires
.PHONY : apps/swrx/CMakeFiles/gpsSim.dir/requires

apps/swrx/CMakeFiles/gpsSim.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && $(CMAKE_COMMAND) -P CMakeFiles/gpsSim.dir/cmake_clean.cmake
.PHONY : apps/swrx/CMakeFiles/gpsSim.dir/clean

apps/swrx/CMakeFiles/gpsSim.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/swrx /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx/CMakeFiles/gpsSim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/swrx/CMakeFiles/gpsSim.dir/depend

