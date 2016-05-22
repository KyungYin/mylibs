.SUFFIXES : .c .o

      DEBUG := y
         Q_ ?= @

#  ARCH_TOOL := arm-linux-gnueabihf-
         CC := $(ARCH_TOOL)gcc
        CXX := $(ARCH_TOOL)g++
         AR := $(ARCH_TOOL)ar
         RM ?= /bin/rm -rf

     CFLAGS := -Wall
     CFLAGS += -g
#    CFLAGS += -O2
     CFLAGS += -fPIC
     CFLAGS += -D_GNU_SOURCE
     CFLAGS += -I.

    LDFLAGS := -lpthread 
    LDFLAGS += -L.

 	 TARGET := test

	   OBJS := test_main.o

	   OBJS += byte_buffer.o

all: $(TARGET) install

$(TARGET): $(OBJS) 
	@echo
	@echo [...Linking $@...]
	$(Q_) $(CC) -o $@ $(OBJS) $(LDFLAGS)

distclean: clean

clean:
	@echo
	@echo [...Clean...]
	$(Q_)$(RM) -f $(OBJS) $(TARGET)

install: 
	@echo
	@echo [...Install...]

.c.o:
	@echo
	@echo [...Compile  $<...]
	$(Q_) $(CC) -o $@ -c $(CFLAGS) $<
