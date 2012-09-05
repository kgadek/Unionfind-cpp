CXX         =   clang++
CXXFLAGS    =   -O0 -g -ggdb3\
                -W -Wall -Wshadow -Wformat\
                -Wsequence-point -Wunused\
		        -Wuninitialized -Wfloat-equal -ansi\
		        -pedantic -Weffc++
LDFLAGS     =   -lm

.PHONY: clean doxy all

all: u doxy

u: u.cpp set.h
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(<:%.cpp=%.cpp) -o $@

clean:
	rm -f u
	rm -rf doc

doxy: u.cpp set.h
	doxygen
