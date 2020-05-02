#!/bin/sh
TMPFILE1=$(mktemp /tmp/im1.XXXXXX)
TMPFILE2=$(mktemp /tmp/im2.XXXXXX)

# handling ctrl+c
trap "rm -f $TMPFILE1 $TMPFILE2; exit 1" INT

echo "$TMPFILE1 $TMPFILE2"

cat /proc/interrupts > $TMPFILE1
sleep 2
cat /proc/interrupts > $TMPFILE1
diff $TMPFILE1 $TMPFILE2
rm -f $TMPFILE1 $TMPFILE2
