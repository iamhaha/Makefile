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
		-I$(INCLUDE_DIR)
		
###### lib path ######

###### Compiler settings ######
CC=gcc
CFLAGS=-Wall -W -g 
LDFLAGS=

###### Targets ######
.PHONY: all clean

all:$(OBJS) 
	$(CC) -o $(PROGRAM) $(OBJS) $(LDFLAGS) 

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.$(EXTENSION) 
	$(CC) $< -o $@ -c $(CFLAGS) $(INCLUDE)

clean:
	rm -rf $(OBJS) $(LIB_DIR)/lib* $(BIN_DIR)/* 

