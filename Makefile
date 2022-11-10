ver = debug
platform = arm

CC = arm-linux-gnueabi
#INCLIB = /usr/local/include
#LDLIB = /usr/local/lib
# OPENCV = -lopencv_core -lopencv_highgui -lopencv_imgproc#$(shell pkg-config --cflags opencv) $(shell pkg-config --libs opencv) -I/usr/include/opencv2
#USB =  -I../libusb/include  -L../libusb/$(platform) -lusb-1.0  



LIBSPATH = -L. -I.



ifeq ($(ver), debug)
DEFS = -D_LIN -D_DEBUG 
CFLAGS = -g  -I $(INCLIB) -L $(LDLIB) $(DEFS) $(COMMON) $(LIBSPATH)  -lpthread  -DGLIBC_20 -lstdc++
else
DEFS = -D_LIN 
CFLAGS =  -O3 -I $(INCLIB) -L $(LDLIB) $(DEFS) $(COMMON) $(LIBSPATH)  -lpthread  -DGLIBC_20 -lstdc++
endif

CC = arm-linux-gnueabi-g++
AR= arm-linux-gnueabi-ar
CFLAGS += -march=armv7 -mthumb


all: test_gui2_snap test_gui2_video

test_gui2_snap:
	$(CC)  main_SDK2_snap.cpp -o test_gui2_snap $(CFLAGS) -lASICamera2

test_gui2_video:
	$(CC)  main_SDK2_video.cpp -o test_gui2_video $(CFLAGS) -lASICamera2

install:
	mv test_gui2_snap ../../target/root/
	mv test_gui2_video ../../target/root/
clean:
	rm -f test_gui2_snap test_gui2_video
#pkg-config libusb-1.0 --cflags --libs
#pkg-config opencv --cflags --libs

