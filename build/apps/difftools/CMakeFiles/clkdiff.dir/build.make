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
include apps/difftools/CMakeFiles/clkdiff.dir/depend.make

# Include the progress variables for this target.
include apps/difftools/CMakeFiles/clkdiff.dir/progress.make

# Include the compile flags for this target's objects.
include apps/difftools/CMakeFiles/clkdiff.dir/flags.make

apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o: apps/difftools/CMakeFiles/clkdiff.dir/flags.make
apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o: ../apps/difftools/clkdiff.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clkdiff.dir/clkdiff.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/difftools/clkdiff.cpp

apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clkdiff.dir/clkdiff.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/difftools/clkdiff.cpp > CMakeFiles/clkdiff.dir/clkdiff.cpp.i

apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clkdiff.dir/clkdiff.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/difftools/clkdiff.cpp -o CMakeFiles/clkdiff.dir/clkdiff.cpp.s

apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.requires:
.PHONY : apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.requires

apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.provides: apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.requires
	$(MAKE) -f apps/difftools/CMakeFiles/clkdiff.dir/build.make apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.provides.build
.PHONY : apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.provides

apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.provides.build: apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o

# Object files for target clkdiff
clkdiff_OBJECTS = \
"CMakeFiles/clkdiff.dir/clkdiff.cpp.o"

# External object files for target clkdiff
clkdiff_EXTERNAL_OBJECTS =

apps/difftools/clkdiff: apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o
apps/difftools/clkdiff: apps/difftools/CMakeFiles/clkdiff.dir/build.make
apps/difftools/clkdiff: libgpstk.dylib
apps/difftools/clkdiff: apps/difftools/CMakeFiles/clkdiff.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable clkdiff"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clkdiff.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/difftools/CMakeFiles/clkdiff.dir/build: apps/difftools/clkdiff
.PHONY : apps/difftools/CMakeFiles/clkdiff.dir/build

apps/difftools/CMakeFiles/clkdiff.dir/requires: apps/difftools/CMakeFiles/clkdiff.dir/clkdiff.cpp.o.requires
.PHONY : apps/difftools/CMakeFiles/clkdiff.dir/requires

apps/difftools/CMakeFiles/clkdiff.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools && $(CMAKE_COMMAND) -P CMakeFiles/clkdiff.dir/cmake_clean.cmake
.PHONY : apps/difftools/CMakeFiles/clkdiff.dir/clean

apps/difftools/CMakeFiles/clkdiff.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/difftools /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools /Users/shjzhang/Documents/Develop/gpstk/build/apps/difftools/CMakeFiles/clkdiff.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/difftools/CMakeFiles/clkdiff.dir/depend

