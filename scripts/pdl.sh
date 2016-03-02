SRC_DIR=s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P
rsync -avz --progress --delete /data/rdc $SRC_DIR
echo "===> OK pushed to dlapp:rdc"
echo

NOTE_DIR=/data/gits/lplin/tech-notes
rsync -avz --progress --delete --exclude '.git' $NOTE_DIR $SRC_DIR
echo "===> OK pushed to dlapp:tech-notes"
echo
cd $NOTE_DIR
git commit -am "Push at "`date +%Y-%m-%d.%H:%M:%S`
git push origin master
echo "===> OK tech-notes pushed to github.com"

