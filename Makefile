#CXX ?= clang++
#CXXFLAGS ?= -fsanitize=address -Werror -Wall -Wextra -g -O0 -DTINYEXR_USE_MINIZ=0 -DTINYEXR_USE_PIZ=0
#LDFLAGS ?= -lz

# ZFP
#CXXFLAGS += -DTINYEXR_USE_ZFP=1 -I./deps/ZFP/inc
#LDFLAGS += -L./deps/ZFP/lib -lzfp

CFLAGS += -I./deps/miniz
CXXFLAGS += -I./deps/miniz

miniz.o:
	$(CC) $(CFLAGS) -c ./deps/miniz/miniz.c

all:
	$(CXX) $(CXXFLAGS) -o test_tinyexr test_tinyexr.cc miniz.o $(LDFLAGS)

test:
	./test_tinyexr asakusa.exr

.PHONY: test
