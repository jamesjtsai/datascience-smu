# MSDS6391 Visualization 2
# Assignment #3
# GuessThatImage Makefile
# Author: James Tsai and Wid Sogata
# Date: 01/31/2017

OBJS = Check.o Display.o GuessThatImage.o Menu.o
CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)

GuessThatImage : $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o GuessThatImage

clean:
	rm -f *.o *.tar GuessThatImage

tar:
	tar cvf GuessThatImage.tar Check.h Check.cpp Display.h Display.cpp \
					GuessThatImage.h GuessThatImage.cpp Menu.h Menu.cpp \
					logo/guessthatimage.txt images/*
