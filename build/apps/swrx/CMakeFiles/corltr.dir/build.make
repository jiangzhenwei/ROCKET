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
include apps/swrx/CMakeFiles/corltr.dir/depend.make

# Include the progress variables for this target.
include apps/swrx/CMakeFiles/corltr.dir/progress.make

# Include the compile flags for this target's objects.
include apps/swrx/CMakeFiles/corltr.dir/flags.make

apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o: apps/swrx/CMakeFiles/corltr.dir/flags.make
apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o: ../apps/swrx/corltr.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/corltr.dir/corltr.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/swrx/corltr.cpp

apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/corltr.dir/corltr.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/swrx/corltr.cpp > CMakeFiles/corltr.dir/corltr.cpp.i

apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/corltr.dir/corltr.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/swrx/corltr.cpp -o CMakeFiles/corltr.dir/corltr.cpp.s

apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.requires:
.PHONY : apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.requires

apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.provides: apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.requires
	$(MAKE) -f apps/swrx/CMakeFiles/corltr.dir/build.make apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.provides.build
.PHONY : apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.provides

apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.provides.build: apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o

# Object files for target corltr
corltr_OBJECTS = \
"CMakeFiles/corltr.dir/corltr.cpp.o"

# External object files for target corltr
corltr_EXTERNAL_OBJECTS =

apps/swrx/corltr: apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o
apps/swrx/corltr: apps/swrx/CMakeFiles/corltr.dir/build.make
apps/swrx/corltr: apps/swrx/libsimlib.a
apps/swrx/corltr: libgpstk.dylib
apps/swrx/corltr: apps/swrx/CMakeFiles/corltr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable corltr"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/corltr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/swrx/CMakeFiles/corltr.dir/build: apps/swrx/corltr
.PHONY : apps/swrx/CMakeFiles/corltr.dir/build

apps/swrx/CMakeFiles/corltr.dir/requires: apps/swrx/CMakeFiles/corltr.dir/corltr.cpp.o.requires
.PHONY : apps/swrx/CMakeFiles/corltr.dir/requires

apps/swrx/CMakeFiles/corltr.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx && $(CMAKE_COMMAND) -P CMakeFiles/corltr.dir/cmake_clean.cmake
.PHONY : apps/swrx/CMakeFiles/corltr.dir/clean

apps/swrx/CMakeFiles/corltr.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/swrx /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx /Users/shjzhang/Documents/Develop/gpstk/build/apps/swrx/CMakeFiles/corltr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/swrx/CMakeFiles/corltr.dir/depend

