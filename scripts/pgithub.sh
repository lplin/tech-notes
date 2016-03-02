#!/bin/bash
NOTE_DIR=/data/gits/lplin/tech-notes
ZIP_FILE=/data/bak/tech-notes-`date +%a`.7z
cd $NOTE_DIR
rm $ZIP_FILE
7z a -p $ZIP_FILE *
git commit -am "Push at "`date +%Y-%m-%d.%H:%M:%S`
git push origin master
