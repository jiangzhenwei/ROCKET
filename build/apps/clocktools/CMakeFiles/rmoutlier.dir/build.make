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
include apps/clocktools/CMakeFiles/rmoutlier.dir/depend.make

# Include the progress variables for this target.
include apps/clocktools/CMakeFiles/rmoutlier.dir/progress.make

# Include the compile flags for this target's objects.
include apps/clocktools/CMakeFiles/rmoutlier.dir/flags.make

apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o: apps/clocktools/CMakeFiles/rmoutlier.dir/flags.make
apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o: ../apps/clocktools/rmoutlier.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/clocktools/rmoutlier.cpp

apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rmoutlier.dir/rmoutlier.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/clocktools/rmoutlier.cpp > CMakeFiles/rmoutlier.dir/rmoutlier.cpp.i

apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rmoutlier.dir/rmoutlier.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/clocktools/rmoutlier.cpp -o CMakeFiles/rmoutlier.dir/rmoutlier.cpp.s

apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.requires:
.PHONY : apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.requires

apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.provides: apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.requires
	$(MAKE) -f apps/clocktools/CMakeFiles/rmoutlier.dir/build.make apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.provides.build
.PHONY : apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.provides

apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.provides.build: apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o

# Object files for target rmoutlier
rmoutlier_OBJECTS = \
"CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o"

# External object files for target rmoutlier
rmoutlier_EXTERNAL_OBJECTS =

apps/clocktools/rmoutlier: apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o
apps/clocktools/rmoutlier: apps/clocktools/CMakeFiles/rmoutlier.dir/build.make
apps/clocktools/rmoutlier: libgpstk.dylib
apps/clocktools/rmoutlier: apps/clocktools/CMakeFiles/rmoutlier.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable rmoutlier"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rmoutlier.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/clocktools/CMakeFiles/rmoutlier.dir/build: apps/clocktools/rmoutlier
.PHONY : apps/clocktools/CMakeFiles/rmoutlier.dir/build

apps/clocktools/CMakeFiles/rmoutlier.dir/requires: apps/clocktools/CMakeFiles/rmoutlier.dir/rmoutlier.cpp.o.requires
.PHONY : apps/clocktools/CMakeFiles/rmoutlier.dir/requires

apps/clocktools/CMakeFiles/rmoutlier.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools && $(CMAKE_COMMAND) -P CMakeFiles/rmoutlier.dir/cmake_clean.cmake
.PHONY : apps/clocktools/CMakeFiles/rmoutlier.dir/clean

apps/clocktools/CMakeFiles/rmoutlier.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/clocktools /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools /Users/shjzhang/Documents/Develop/gpstk/build/apps/clocktools/CMakeFiles/rmoutlier.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/clocktools/CMakeFiles/rmoutlier.dir/depend

