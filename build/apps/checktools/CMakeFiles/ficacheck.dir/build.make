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
include apps/checktools/CMakeFiles/ficacheck.dir/depend.make

# Include the progress variables for this target.
include apps/checktools/CMakeFiles/ficacheck.dir/progress.make

# Include the compile flags for this target's objects.
include apps/checktools/CMakeFiles/ficacheck.dir/flags.make

apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o: apps/checktools/CMakeFiles/ficacheck.dir/flags.make
apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o: ../apps/checktools/ficacheck.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/gpstk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ficacheck.dir/ficacheck.cpp.o -c /Users/shjzhang/Documents/Develop/gpstk/apps/checktools/ficacheck.cpp

apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ficacheck.dir/ficacheck.cpp.i"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/gpstk/apps/checktools/ficacheck.cpp > CMakeFiles/ficacheck.dir/ficacheck.cpp.i

apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ficacheck.dir/ficacheck.cpp.s"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/gpstk/apps/checktools/ficacheck.cpp -o CMakeFiles/ficacheck.dir/ficacheck.cpp.s

apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.requires:
.PHONY : apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.requires

apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.provides: apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.requires
	$(MAKE) -f apps/checktools/CMakeFiles/ficacheck.dir/build.make apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.provides.build
.PHONY : apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.provides

apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.provides.build: apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o

# Object files for target ficacheck
ficacheck_OBJECTS = \
"CMakeFiles/ficacheck.dir/ficacheck.cpp.o"

# External object files for target ficacheck
ficacheck_EXTERNAL_OBJECTS =

apps/checktools/ficacheck: apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o
apps/checktools/ficacheck: apps/checktools/CMakeFiles/ficacheck.dir/build.make
apps/checktools/ficacheck: libgpstk.dylib
apps/checktools/ficacheck: apps/checktools/CMakeFiles/ficacheck.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ficacheck"
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ficacheck.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/checktools/CMakeFiles/ficacheck.dir/build: apps/checktools/ficacheck
.PHONY : apps/checktools/CMakeFiles/ficacheck.dir/build

apps/checktools/CMakeFiles/ficacheck.dir/requires: apps/checktools/CMakeFiles/ficacheck.dir/ficacheck.cpp.o.requires
.PHONY : apps/checktools/CMakeFiles/ficacheck.dir/requires

apps/checktools/CMakeFiles/ficacheck.dir/clean:
	cd /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools && $(CMAKE_COMMAND) -P CMakeFiles/ficacheck.dir/cmake_clean.cmake
.PHONY : apps/checktools/CMakeFiles/ficacheck.dir/clean

apps/checktools/CMakeFiles/ficacheck.dir/depend:
	cd /Users/shjzhang/Documents/Develop/gpstk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/gpstk /Users/shjzhang/Documents/Develop/gpstk/apps/checktools /Users/shjzhang/Documents/Develop/gpstk/build /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools /Users/shjzhang/Documents/Develop/gpstk/build/apps/checktools/CMakeFiles/ficacheck.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/checktools/CMakeFiles/ficacheck.dir/depend

