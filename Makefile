#syntax
#
# target: dependencies
# [TAB]system command
#
# UPCASEWORD= means constant expression
#
# $^ is substituted with all of the target ’ s dependancy files
# $< is the first dependancy and $@ is the target files


########### old commad ##############
# all:								#
# 	flex scanner.l 					#
# 	gcc lex.yy.c -lfl -o scanner	#
#####################################

CC=gcc
CS=flex
CFLAGS= -lfl -o
LDFLAGS=
DIR=tmp/
SOURCES=$(addprefix $(DIR),$(GRAMMAR:.l=.c))
GRAMMAR=scanner.l
OBJECTS=$(addprefix bin/,$(notdir $(SOURCES:.cpp=.o)))
EXECUTABLE=scanner


all: $(DIR) $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES)
	$(CC) $< $(CFLAGS) $@
	# enjoy it :D

$(SOURCES): $(GRAMMAR)
	$(CS) $<

# Regular Expression very OverPower
# %.o: %.c
# 	$(CC) $(FLAGS) $< -o $@

$(DIR):
	mkdir $@

clean:
	rm -rf tmp/

help:
	@echo "to compile type 'make'"
	@echo "to clean the trashes type 'make clean'"
