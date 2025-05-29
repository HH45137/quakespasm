#!/bin/sh

# Change this script to meet your needs and/or environment.

TARGET=arm-linux-gnueabihf

MAKE_CMD=make

CC="$TARGET-gcc"
AS="$TARGET-as"
RANLIB="$TARGET-ranlib"
AR="$TARGET-ar"
STRIP="$TARGET-strip"
export CC AS AR RANLIB STRIP

exec $MAKE_CMD -j$(nproc) CC=$CC AS=$AS RANLIB=$RANLIB AR=$AR STRIP=$STRIP -f Makefile $* 
