#=======================================
# makefile, v1.0.0
# Author: iamhaha <dingshlong@gmail.com>
# Desc: makefile sample for c++ projects;
#         generate executable binaries.
#=======================================

###### Paths ######
DIR=$(shell pwd)
BIN_DIR=$(DIR)/bin
LIB_DIR=$(DIR)/lib
SRC_DIR=$(DIR)/src
OBJ_DIR=$(DIR)/obj
INCLUDE_DIR=$(DIR)/include
OUTPUT=$(BIN_DIR)/output

###### source files ######
EXTENSION=cpp
OBJS=$(patsubst $(SRC_DIR)/%.$(EXTENSION), $(OBJ_DIR)/%.o,$(wildcard $(SRC_DIR)/*.$(EXTENSION)))

###### include path ######
INCLUDE=-I$(INCLUDE_DIR)
        
###### lib path ######
LIBINCLUDE=-L$(LIB_DIR)

###### Compiler settings ######
CC=g++
CFLAGS=-c -Wall -g 
LFLAGS=-Wall -g

###### Targets ######
.PHONY: all prep clean

all: prep $(OBJS)
	@echo "Generate $(OUTPUT):"
	$(CC) $(LFLAGS) $(OBJS) -o $(OUTPUT)

prep:
	@echo "Check output directories:"
	if [ ! -d $(OBJ_DIR) ]; then mkdir -p $(OBJ_DIR); fi;
	if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi;

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.$(EXTENSION) 
	@echo "Compile $@:"
	$(CC) $< $(CFLAGS) $(INCLUDE) -o $@

clean:
	-rm -rf $(OBJS) $(BIN_DIR)/*
