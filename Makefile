# makefile

###### Paths ######
DIR=$(shell pwd)
BIN_DIR=$(DIR)/bin
LIB_DIR=$(DIR)/lib
SRC_DIR=$(DIR)/src
INCLUDE_DIR=$(DIR)/include
OBJ_DIR=$(DIR)/obj
PROGRAM=$(BIN_DIR)/test

###### source files ######
EXTENSION=c
OBJS=$(patsubst $(SRC_DIR)/%.$(EXTENSION), $(OBJ_DIR)/%.o,$(wildcard $(SRC_DIR)/*.$(EXTENSION)))

###### include path ######
INCLUDE=\
		-I $(INCLUDE_DIR)
		
###### lib path ######

###### Compiler settings ######
CC=gcc
CFLAGS=-Wall -W -g 
LDFLAGS=

###### Targets ######
.PHONY: all clean

all:$(OBJS) 
	@echo $(DEPS_DIR)
	$(CC) -o $(PROGRAM) $(OBJS) $(LDFLAGS) 


$(DEPS_DIR)/%.d: $(SRC_DIR)/%.$(EXTENSION)
	$(CC) -MM $(INCLUDE) $(CFLAGS) $< | sed -e 1's,^,$(OBJ_DIR)/,' > $@

sinclude $(DEPS)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.$(EXTENSION) 
	$(CC) $< -o $@ -c $(CFLAGS) $(INCLUDE)

clean:
	rm -rf $(OBJS) $(LIB_DIR)/lib* $(BIN_DIR)/* 

