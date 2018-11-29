CC = g++
CFLAGS = -I$(INCDIR)
#link flags
#LDFLAGS = `sdl2-config --cflags --libs ` -lSDL2_image 
LDFLAGS = -lpthread

#directories
INCDIR =./include
OBJDIR = ./obj
BINDIR = ./bin
SRCDIR = ./src

EXEC = barber

SOURCES = main.cpp 
_OBJ = $(SOURCES:.cpp=.o)
OBJ  = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

all: $(BINDIR)/$(EXEC)

$(BINDIR)/$(EXEC): $(OBJ)
	$(CC) -o $(BINDIR)/$(EXEC) $(OBJ) $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) -c -o $@ $< $(CFLAGS)




clean:
	rm $(OBJDIR)/*.o
	rm $(BINDIR)/$(EXEC)