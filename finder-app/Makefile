CC := $(CROSS_COMPILE)gcc
SRCS := writer.c
TARGET := writer

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) -o $@ $(SRCS)

clean:
	rm -f $(TARGET)
	