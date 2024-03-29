#----------------------------------- optional setting
OPT += -DNEUTRINO

#----------------------------------- 
CXX = g++
OPTIMIZE = -Wall -fopenmp
CXXFLAGS = $(OPTIMIZE) $(OPT)

OBJS = initialize.o density.o io.o main.o memory.o vars.o powerspectrum.o 
INCLS = initialize.h density.h io.h	memory.h powerspectrum.h vars.h
EXEC = POWERSPEC
FFTW_INCL = -I/home/rui/library/fftw2/include
FFTW_LIBS = -L/home/rui/library/fftw2/lib

$(EXEC) : $(OBJS)
	$(CXX) $(CXXFLAGS) $(FFTW_LIBS) $(OBJS) -lfftw -lm -o $(EXEC)

$(OBJS) : $(INCLS)
	$(CXX) $(CXXFLAGS) $(FFTW_INCL) -c -o $*.o $*.cc

clean :
	rm -f $(EXEC) $(OBJS)
