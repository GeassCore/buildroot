#!/bin/sh

BOARD_DIR="$(dirname $0)"

cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr

cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
cp $BINARIES_DIR/uEnv.txt $TARGET_DIR/boot/uEnv.txt