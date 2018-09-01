.PHONY: deploy install clean

NAME       := tinyxml2
VERSION    := 6.2.1
BIN_DIR    := bin
BINARY     := $(BIN_DIR)/$(NAME)

SRC_DIR    := src
SRC_FILES  := $(wildcard $(SRC_DIR)/*.cpp)
CXXFLAGS   := -fPIC --std=c++17
CXXINC     :=

OBJ_DIR    := obj
OBJ_FILES  := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
LDFLAGS    := -shared
LDLIBS     := -pthread -lrt
	
$(BINARY): $(OBJ_FILES) $(BIN_DIR)
	g++ $(LDFLAGS) -o $@ $(OBJ_FILES) $(LDLIBS)
	
$(BIN_DIR):
	mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(OBJ_DIR)
	g++ $(CXXFLAGS) $(CXXINC) -c -o $@ $<

$(OBJ_DIR):
	mkdir -p $@
	
clean:
	rm -rf $(BIN_DIR) $(OBJ_DIR)