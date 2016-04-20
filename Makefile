SYS = MacOSX-x86-64
MLDIR = /Applications/Mathematica.app/Contents/SystemFiles/Links/MathLink/DeveloperKit/${SYS}/CompilerAdditions
MMALIBDIR = /Applications/Mathematica.app/Contents/SystemFiles/Libraries/${SYS}


CC = g++
LD = g++
CFLAGS = -Wall -O3
LIBS = -Llib -L$(MLDIR) -L$(MMALIBDIR) -lMLi4 -stdlib=libstdc++ -framework Foundation -lc++
INCLUDE = -Iinclude -I$(MLDIR)
OBJS  = $(patsubst src/%.cc,lib/%.o,$(wildcard src/*.cc))
EXECS = $(patsubst exe/%.cc,bin/%,$(wildcard exe/*.cc))
EXEOBJS  = $(patsubst exe/%.cc,lib/%.o,$(wildcard exe/*.cc))
MLOBJS  = $(patsubst mathlink/%.tm,lib/%_tm.o,$(wildcard mathlink/*.tm))
MLCCS  = $(patsubst mathlink/%.tm,mathlink/%_tm.cc,$(wildcard mathlink/*.tm))


MPREP = $(MLDIR)/mprep


all: $(MLCCS) $(MLOBJS) $(OBJS) $(EXEOBJS) $(EXECS)

print:
	echo $(MLCCS)
	echo $(MLOBJS)
	echo $(OBJS)
	echo $(EXEOBJS)
	echo $(EXECS)


mathlink/%_tm.cc : mathlink/%.tm
	$(MPREP) $< -o $@

lib/%.o : src/%.cc
	$(CC) -Wall $(CFLAGS) $(INCLUDE) -c $< -o $@

lib/%.o : exe/%.cc
	$(CC) -Wall $(CFLAGS) $(INCLUDE) -c $< -o $@

lib/%.o : $(MLCCS)
	$(CC) -Wall $(CFLAGS) $(INCLUDE) -c $< -o $@


bin/% : $(MLOBJS) $(OBJS) $(EXEOBJS)
	$(LD) $(LIBS) $(OBJS) $(MLOBJS) lib/$*.o -o bin/$*





clean:
	rm -f $(MLCCS) $(MLOBJS) $(OBJS) $(EXEOBJS) $(EXECS)

